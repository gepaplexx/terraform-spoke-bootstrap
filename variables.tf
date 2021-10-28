variable "vmware_user" {
  type = string
  description = "The vsphere user used by terrafrom for authentication."
}

variable "vmware_password" {
  type = string
  description = "The vsphere password used by terrafrom for authentication."
}

variable "vmware_host" {
  type = string
  description = "The vsphere host name used by terrafrom."
}


variable "vmware_esxi_hosts" {
  type = list(string)
  description = "The vsphere hosts used by terrafrom."
}


variable "vmware_datacenter" {
  type = string
  description = "The vsphere datacenter name used by terrafrom."
}

variable "vmware_computecluster" {
  type = string
  description = "todo."
}

variable "vmware_datastore" {
  type = string
  description = "todo."
}

variable "vmware_template" {
  type = string
  description = "todo."
}



variable "spoke_name" {
  type = string
  description = "Name of the spoke network. preferably use the FQDN."
}

variable "spoke_vlan_id" {
  type = number
  description = "vlan id used for this spoke network."
}

variable "spoke_vswitch" {
  type = string
  description = "vSwitch we need to attach our spoke network to."
}

variable "spoke_network" {
  type = string
  description = "todo."
}

variable "spoke_netmask" {
  type = string
  description = "todo."
}
