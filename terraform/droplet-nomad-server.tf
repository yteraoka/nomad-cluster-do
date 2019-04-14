resource "digitalocean_droplet" "nomad_server" {
  count = "${var.number_of_nomad_server}"
  image = "${var.nomad_droplet_image}"
  name = "nomad-server-${count.index}"
  region = "${var.region}"
  size = "s-1vcpu-1gb"
  ssh_keys = ["${digitalocean_ssh_key.key.id}"]
  monitoring = true
  private_networking = true
  tags = ["nomad-server"]
}
