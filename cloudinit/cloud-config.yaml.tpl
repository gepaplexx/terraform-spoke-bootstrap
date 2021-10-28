#cloud-config
chpasswd: #Change your local password here
    list: |
      ansible:ansible
    expire: false
users:
  - name: ansible
    ssh-authorized-keys:
      - ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCkPzBFd/12Ba3J7XMXcU2iC6b9HZxTqH8rsUJd3I2fRw2cRcN88s5CrYUlijx7UhiAC3u/eg7OeuW7HQAHAH7IJV1BeEEl9tJTxPoLFr7j8N3+VyhYBaDEO+Cu26Vpzi7pM5uAPUw45mK5NCFfjIInNmjtuu93U/ypK6jJR3nLDwP1QgkqFIBc/wm6RV2EnZb4Vzo3KdCCHZ9iCbPIwY3at9HpOsZ/R6o5KdaVDdEk1vdjH/XKwVUkeEH1+lO6MLggDQRIVb0GXOv1k3P2kZnEg+TNiQ/rEf1ld5Se2YW5yQJ0dooIeXY/NCxrsVqmHKVb9X1iCwFneZ3nNotrxUZtXOY+Xg30+UtGyqThTJA8u23vF7kSv1HgXQ8CJsTHvz/py0leih7pEADGl9ZbbWNbBzR3zLIzMclt/Y3+uXBr8SDb109eULnL5jhjg+kwXly7HNg/UwlNFLZxiH19joQZ/nWSw33wC9QAnnMZEei1nrf1YsGXBT43mUUgKB7KJG0JqXNaFn99YyDIb3gv163VyqD7+j+O+igJEzh4pv758KtbiG9viVGIQBG5tKO2x+LSj8OR4T+BRpw2L+rM7DD61iVPxoQ0eWg6WfSCCGWKhjWpmk8BnftUJo90PEmpte4drIAXockcEQq+c8Aa/TKrGoePzCe7/sNRkG+VEZ+8zw== ansible@gepaplexx.com
    sudo: ['ALL=(ALL) NOPASSWD:ALL']
    groups: sudo
    shell: /bin/bash

${network_config}