resource "digitalocean_vpc" "web_vpc" {
  name     = "${var.env_prefix}-web-vpc"
  region   = var.env_region
  ip_range = var.vpc_ip_range
}
