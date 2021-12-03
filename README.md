# Terraform: spoke-bootstrap

![MIT](https://img.shields.io/badge/license-MIT-brightgreen.svg?style=flat-square)
![GitHub last commit](https://img.shields.io/github/last-commit/gepaplexx/terraform-spoke-bootstrap?style=flat-square)
![Maintenance](https://img.shields.io/maintenance/yes/2022?style=flat-square)

Create host-port-group, vSphere folder and the service0 with a static IP for a spoke network with terraform.

Variable Name | Type | Description
------------ | ------------- | -------------
authorized_key | string | authorized key used to log in to all vms in the spoke network. authorized_key for user 'core' on all ocp vms and authorized_key for user 'ansible' on all other vms.
spoke_mac_prefix | string | MAC address prefix used for each vm in the spoke network.
spoke_network_name | string | Name of the network. preferably use the FQDN of the ocp cluster.
spoke_network | string | Specify the network for this spoke network. E.g. for a class c network set the variable to 192.168.0
spoke_netmask | string | Specify the netmask for for this spoke network. E.g. for a class c network set the variable 24
spoke_vlan_id | number | Specify the vlan id associated to the network.
spoke_vswitch | string | Specify the vswitch the network should be attached to.
vmware_host | string | The vsphere host name or ip used for authentication.
vmware_user | string | The vsphere user used for authentication.
vmware_password | string | The vsphere passwordused for authentication.
vmware_esxi_hosts | list(string) | The vsphere esx host names.
vmware_datacenter | string | The vsphere datacenter name.
vmware_computecluster | string | The vsphere computecluster name.
vmware_datastore | string | The vsphere datastore name.
vmware_template | string | The vsphere vm template used to provision new vms.
service_vm_cpu | number | Specify the cpu for service vms.
service_vm_memory_mb | number | Specify the ram in MB for service vms.

## License

MIT

## Contributions

- [@ckaserer](https://github.com/ckaserer)
