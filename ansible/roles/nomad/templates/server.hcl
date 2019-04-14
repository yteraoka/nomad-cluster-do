server {
  enabled = true
  bootstrap_expect = 3
  encrypt = "{{ nomad_encrypt_key }}"
}
