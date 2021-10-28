network:
  version: 2
  ethernets:
    ens192:
      dhcp4: false #true to use dhcp
      addresses:
        -  ${ipv4}/${ipv4_subnet_mask} #Set you ip here
      gateway4: ${ipv4_gateway} # Set gw here 
      nameservers:
        addresses:
          - 8.8.8.8 # Set DNS ip address here
        dns_search:
          - mycompany.com