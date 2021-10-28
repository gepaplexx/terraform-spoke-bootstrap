resource "vsphere_host_port_group" "pg" {
  count               = "${length(var.vmware_esxi_hosts)}"
  name                = "${var.spoke_name}"
  host_system_id      = "${data.vsphere_host.host[count.index].id}"
  virtual_switch_name = "${var.spoke_vswitch}"
  vlan_id             = "${var.spoke_vlan_id}"
}

resource "vsphere_folder" "folder" {
  path = "GP/${var.spoke_name}"
  type = "vm"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

resource "time_sleep" "wait_30_seconds" {
  depends_on = [vsphere_host_port_group.pg]

  create_duration = "30s"
}

resource vsphere_virtual_machine "vm" {
  name             = "test"
  resource_pool_id = "${data.vsphere_compute_cluster.cc.resource_pool_id}"
  datastore_id     = "${data.vsphere_datastore.ds.id}"
  folder           = "GP/${var.spoke_name}"
  depends_on       = [vsphere_host_port_group.pg,vsphere_folder.folder]

  num_cpus = 2
  memory   = 1024
  guest_id = "${data.vsphere_virtual_machine.template.guest_id}"
  scsi_type = "${data.vsphere_virtual_machine.template.scsi_type}"

  cdrom {
    client_device = true
  }

  network_interface {
    network_id   = "${data.vsphere_network.network.id}"
    adapter_type = "${data.vsphere_virtual_machine.template.network_interface_types[0]}"
  }
  wait_for_guest_net_timeout = 0

  disk {
    label            = "disk0"
    size             = "${data.vsphere_virtual_machine.template.disks.0.size}"
    eagerly_scrub    = "${data.vsphere_virtual_machine.template.disks.0.eagerly_scrub}"
    thin_provisioned = "${data.vsphere_virtual_machine.template.disks.0.thin_provisioned}"
  }

  clone {
    template_uuid = "${data.vsphere_virtual_machine.template.id}"
  }

  vapp {
    properties ={
      hostname = "test"
      user-data = base64encode(file("${path.module}/cloudinit/kickstart.yaml"))
    }
  }

  # extra_config = {
  #   "guestinfo.metadata" = base64encode(templatefile("${path.module}/cloudinit/metadata.json.tpl", {
  #       name = "metadata"

  #       network_config = base64encode(templatefile("${path.module}/cloudinit/network.tpl", {
  #         ipv4_subnet_mask = "24"
  #         ipv4             = "10.252.1.10"
  #         ipv4_gateway     = "10.252.1.254"
  #       }))
  #     }))
  #   "guestinfo.metadata.encoding" = "base64"
  # }

#  extra_config = {
#    "guestinfo.metadata"          = base64encode(file("${path.module}/cloudinit/metadata.yaml"))
#    "guestinfo.metadata.encoding" = "base64"
#    "guestinfo.userdata"          = base64encode(file("${path.module}/cloudinit/userdata.yaml"))
#    "guestinfo.userdata.encoding" = "base64"
#  }
}