resource "digitalocean_droplet" "nomad_client" {
  count = "${var.number_of_nomad_client}"
  image = "${var.nomad_droplet_image}"
  name = "nomad-client-${count.index}"
  region = "${var.region}"
  size = "s-1vcpu-2gb"
  ssh_keys = ["${digitalocean_ssh_key.key.id}"]
  monitoring = true
  private_networking = true
  tags = ["nomad-client"]
}
