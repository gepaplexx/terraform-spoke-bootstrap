write_files:
  - encoding: base64
    content: ${network_config_content_base64}
    path: /etc/netplan/50-cloud-init.yaml

runcmd:
  - netplan apply

# bmV0d29yazoKIHZlcnNpb246IDIKIGV0aGVybmV0czoKICAgZW5zMTkyOgogICAgYWRkcmVzc2VzOiBbMTkyLjE2OC4xMTEuMTExLzI0XQogICAgZ2F0ZXdheTQ6IDE5Mi4xNjguMTExLjEK