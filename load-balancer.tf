data "digitalocean_certificate" "certificate" {
  name = var.certificate_name
}

resource "digitalocean_loadbalancer" "web_lb" {
  name     = "${var.env_prefix}-loadbalancer"
  region   = var.env_region
  vpc_uuid = digitalocean_vpc.web_vpc.id

  forwarding_rule {
    entry_protocol  = "http"
    entry_port      = 80
    target_protocol = "http"
    target_port     = 80
  }

  forwarding_rule {
    entry_protocol   = "https"
    entry_port       = 443
    target_protocol  = "http"
    target_port      = 80
    certificate_name = data.digitalocean_certificate.certificate.name
  }

  healthcheck {
    protocol                 = "http"
    port                     = 80
    path                     = "/"
    check_interval_seconds   = 10
    response_timeout_seconds = 5
    unhealthy_threshold      = 3
    healthy_threshold        = 5
  }

  droplet_ids = digitalocean_droplet.web_droplet[*].id
}