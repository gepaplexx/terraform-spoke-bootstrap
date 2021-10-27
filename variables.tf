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

variable "vmware_datacenter" {
  type = string
  description = "The vsphere datacenter name used by terrafrom."
}

variable "vmware_esxi_hosts" {
  type = list(string)
  description = "The vsphere hosts used by terrafrom."
}

variable "spoke_name" {
  type = string
  description = "Name."
}

variable "spoke_vlan_id" {
  type = number
  description = "Name."
}

variable "spoke_vswitch" {
  type = string
  description = "Name."
}
