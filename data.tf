data "vsphere_datacenter" "dc" {
  name = "${var.vmware_datacenter}"
}

data "vsphere_host" "host" {
  count         = "${length(var.vmware_esxi_hosts)}"
  name          = "${var.vmware_esxi_hosts[count.index]}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}
