resource "digitalocean_droplet" "consul_server" {
  count = "${var.number_of_consul_server}"
  image = "${var.consul_droplet_image}"
  name = "consul-${count.index}"
  region = "${var.region}"
  size = "s-1vcpu-1gb"
  ssh_keys = ["${digitalocean_ssh_key.key.id}"]
  monitoring = true
  private_networking = true
  tags = ["consul-server"]
}
