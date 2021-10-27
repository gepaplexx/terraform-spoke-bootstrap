# Configure the VMware vSphere Provider
provider "vsphere" {
  user           = "${var.vmware_user}"
  password       = "${var.vmware_password}"
  vsphere_server = "${var.vmware_host}"

  # if you have a self-signed cert
  allow_unverified_ssl = true
}

data "vsphere_datacenter" "dc" {
  name = "${var.vmware_datacenter}"
}

data "vsphere_host" "host" {
  count         = "${length(var.vmware_esxi_hosts)}"
  name          = "${var.vmware_esxi_hosts[count.index]}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

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
