resource "digitalocean_ssh_key" "key" {
  name = "nomad terraform"
  public_key = "${file(var.public_key_path)}"
}
