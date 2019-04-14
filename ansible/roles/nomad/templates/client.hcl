# https://www.nomadproject.io/docs/configuration/client.html
client {
  enabled = true
  server_join {
    retry_join = [
{% for host in groups['nomad_server'] %}
      "{{ hostvars[host]['ansible_eth1']['ipv4']['address'] }}",
{% endfor %}
    ]
    retry_max = 3
    retry_interval = "15s"
  }

# network_speed = 500 (link speed を自動で取得するが上書き可能)
# node_class = "prod"
# meta {
#   "owner" = "ops"
# }

# Job に割り当て使用可能なリソースを制限する設定
#  reserved {
#    cpu            = 500  (in MHz)
#    memory         = 512  (in MB)
#    disk           = 1024 (in MB)
#    reserved_ports = "22,80,8500-8600"
#  }
}
