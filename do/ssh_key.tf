resource "digitalocean_ssh_key" "do-ssh_key" {
  name       = var.ssh_key_name
  public_key = file("~/.ssh/do-golden-key.pub")
}