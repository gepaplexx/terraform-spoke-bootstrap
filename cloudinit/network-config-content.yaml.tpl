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
          - ${ipv4_dns} # Set DNS ip address here
          - 8.8.8.8
        # search:
        #   - mycompany.com