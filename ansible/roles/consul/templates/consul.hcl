datacenter = "dc1"
data_dir = "/opt/consul"
encrypt = "{{ consul_encrypt_key }}"
retry_join = [
{% for host in groups['consul_server'] %}
  "{{ hostvars[host]['ansible_eth1']['ipv4']['address'] }}",
{% endfor %}
]
bind_addr = "{{ ansible_eth1.ipv4.address }}"

verify_incoming = true
verify_outgoing = true
verify_server_hostname = false

ca_file = "/etc/consul.d/ca.pem"
cert_file = "/etc/consul.d/cert.pem"
key_file = "/etc/consul.d/key.pem"

addresses {
  https = "0.0.0.0"
}

ports {
  http = -1
  https = 8501
}
