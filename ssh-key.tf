resource "digitalocean_ssh_key" "web_ssh_key" {
  name       = "${var.env_prefix}-web-ssh-key"
  public_key = file(var.ssh_key_path)
}