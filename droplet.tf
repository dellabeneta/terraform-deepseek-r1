resource "digitalocean_droplet" "web_droplet" {
  count    = var.droplet_count
  image    = var.droplet_image
  name     = "${var.env_prefix}-server-${count.index}"
  region   = var.env_region
  size     = var.droplet_size
  vpc_uuid = digitalocean_vpc.web_vpc.id
  ssh_keys = [digitalocean_ssh_key.web_ssh_key.fingerprint]

  user_data = <<-EOT
              #!/bin/bash
              apt-get update
              apt-get install -y nginx
              systemctl enable nginx
              systemctl start nginx
              HOSTNAME=$(hostname)
              echo -e "<html>\n<body>\n<h1>Servidor: $HOSTNAME</h1>\n</body>\n</html>" > /var/www/html/index.nginx-debian.html
              ln -sf /var/www/html/index.nginx-debian.html /var/www/html/index.html
              EOT
}
