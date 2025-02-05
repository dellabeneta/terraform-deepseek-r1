resource "digitalocean_record" "record_name" {
  domain = data.digitalocean_domain.domain.name
  type   = "A"
  name   = var.record_name
  value  = digitalocean_loadbalancer.web_lb.ip
}

data "digitalocean_domain" "domain" {
  name = var.domain_name
}
