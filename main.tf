resource "vsphere_host_port_group" "pg" {
  count               = "${length(var.vmware_esxi_hosts)}"
  name                = "${var.spoke_network_name}"
  host_system_id      = "${data.vsphere_host.host[count.index].id}"
  virtual_switch_name = "${var.spoke_vswitch}"
  vlan_id             = "${var.spoke_vlan_id}"
}

resource "vsphere_folder" "folder" {
  path = "GP/${var.spoke_network_name}"
  type = "vm"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

resource "time_sleep" "wait_30_seconds" {
  depends_on = [vsphere_host_port_group.pg,vsphere_folder.folder]

  create_duration = "30s"
}

resource vsphere_virtual_machine "service0" {
  name             = "service0.${var.spoke_network_name}"
  resource_pool_id = "${data.vsphere_compute_cluster.cc.resource_pool_id}"
  datastore_id     = "${data.vsphere_datastore.ds.id}"
  folder           = "GP/${var.spoke_network_name}"
  depends_on       = [time_sleep.wait_30_seconds]

  num_cpus  = "${var.service_vm_cpu}"
  memory    = "${var.service_vm_memory_mb}"
  guest_id  = "${data.vsphere_virtual_machine.template.guest_id}"
  scsi_type = "${data.vsphere_virtual_machine.template.scsi_type}"

  network_interface {
    network_id   = "${data.vsphere_network.network.id}"
    adapter_type = "${data.vsphere_virtual_machine.template.network_interface_types[0]}"
    use_static_mac = "true"
    mac_address = "${var.spoke_mac_prefix}:01"
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
      hostname = "service0"
      user-data = base64encode(templatefile("${path.module}/cloudinit/cloud-config.yaml.tpl", {
        authorized_key = "${var.authorized_key}"
        network_config = templatefile("${path.module}/cloudinit/network-config.yaml.tpl", {
          network_config_content_base64 = base64encode(templatefile("${path.module}/cloudinit/network-config-content.yaml.tpl", {
            dns     = "${var.spoke_network}.1"
            gateway = "${var.spoke_network}.254"
            netmask = "${var.spoke_netmask}"
            network = "${var.spoke_network}.1"
          }))
        })
      }))
    }
  }
}