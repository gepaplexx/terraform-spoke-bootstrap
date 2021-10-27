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
