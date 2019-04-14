variable "private_key_path" {
  default = "../id_rsa"
}

variable "public_key_path" {
  default = "../id_rsa.pub"
}

variable "region" {
  default = "sgp1"
}

variable "number_of_consul_server" {
  default = 3
}

variable "number_of_nomad_server" {
  default = 3
}

variable "number_of_nomad_client" {
  default = 3
}

variable "consul_droplet_image" {
  default = "centos-7-x64"
}

variable "nomad_droplet_image" {
  default = "centos-7-x64"
}
