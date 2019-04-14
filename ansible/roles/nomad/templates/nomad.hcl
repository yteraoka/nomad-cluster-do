datacenter = "dc1"
data_dir = "/opt/nomad"

# bind_addr = "{{ ansible_eth1.ipv4.address }}"

advertise {
  http = "{{ ansible_eth1.ipv4.address }}"
  rpc  = "{{ ansible_eth1.ipv4.address }}"
  serf = "{{ ansible_eth1.ipv4.address }}"
}

consul {
  address = "127.0.0.1:8501"
  ssl = true
  ca_file = "/etc/consul.d/ca.pem"
  cert_file = "/etc/consul.d/cert.pem"
  key_file = "/etc/consul.d/key.pem"
  verify_ssl = false
}

tls {
  http = true
  rpc  = true

  ca_file = "/etc/consul.d/ca.pem"
  cert_file = "/etc/consul.d/cert.pem"
  key_file = "/etc/consul.d/key.pem"

  verify_server_hostname = false
  verify_https_client    = true
}
