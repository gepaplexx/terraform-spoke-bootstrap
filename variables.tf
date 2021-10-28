variable "authorized_key" {
  type = string
  description = "authorized key used to log in to all vms in the spoke network. authorized_key for user 'core' on all ocp vms and authorized_key for user 'ansible' on all other vms."
}

###############################
# Spoke network configuration #
###############################

variable "spoke_mac_prefix" {
  type = string
  description = "MAC address prefix used for each vm in the spoke network"
}

variable "spoke_network_name" {
  type = string
  description = "Name of the network. preferably use the FQDN of the ocp cluster."
}

variable "spoke_network" {
  type = string
  description = "Specify the network for this spoke network. E.g. for a class c network set the variable to 192.168.0"
}

variable "spoke_netmask" {
  type = string
  description = "Specify the netmask for for this spoke network. E.g. for a class c network set the variable 24"
}

variable "spoke_vlan_id" {
  type = number
  description = "Specify the vlan id associated to the network."
}

variable "spoke_vswitch" {
  type = string
  description = "Specify the vswitch the network should be attached to."
}

########################
# vmware configuration #
########################

#############################
# VM resource configuration #
#############################

variable "vmware_host" {
  type = string
  description = "The vsphere host name or ip used for authentication."
}
variable "vmware_user" {
  type = string
  description = "The vsphere user used for authentication."
}

variable "vmware_password" {
  type = string
  description = "The vsphere passwordused for authentication."
}

variable "vmware_esxi_hosts" {
  type = list(string)
  description = "The vsphere esx host names."
}

variable "vmware_datacenter" {
  type = string
  description = "The vsphere datacenter name."
}

variable "vmware_computecluster" {
  type = string
  description = "The vsphere computecluster name."
}

variable "vmware_datastore" {
  type = string
  description = "The vsphere datastore name."
}

variable "vmware_template" {
  type = string
  description = "The vsphere vm template used to provision new vms."
}


variable "service_vm_cpu" {
  type = number
  description = "Specify the cpu for service vms."
}

variable "service_vm_memory_mb" {
  type = number
  description = "Specify the ram in MB for servicce vms."
}

# variable "lb_vm_cpu" {
#   type = number
#   description = "Specify the cpu for loadbalancer vms."
# }

# variable "lb_vm_memory_mb_mb" {
#   type = number
#   description = "Specify the ram in MB for loadbalancer vms."
# }

# variable "ocp_infra_cpu" {
#   type = number
#   description = "Specify the cpu for ocp infra nodes."
# }

# variable "ocp_infra_memory_mb" {
#   type = number
#   description = "Specify the ram in MB for ocp infra nodes."
# }

# variable "ocp_master_cpu" {
#   type = number
#   description = "Specify the cpu for ocp master nodes."
# }

# variable "ocp_master_memory_mb" {
#   type = number
#   description = "Specify the ram in MB for ocp master nodes."
# }

# variable "ocp_worker_cpu" {
#   type = number
#   description = "Specify the cpu for ocp worker nodes."
# }

# variable "ocp_worker_memory_mb" {
#   type = number
#   description = "Specify the ram in MB for ocp worker nodes."
# }
