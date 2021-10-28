version: 1
config:
  - type: physical
    name: eth0
    subnets:
      - type: static
        address: ${ipv4}/${ipv4_subnet_mask}
        gateway: ${ipv4_gateway}
        dns_nameservers:
          - 8.8.8.8
        dns_search:
          - mycompany.com