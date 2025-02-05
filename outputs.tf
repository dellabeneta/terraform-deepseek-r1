output "droplet_ips" {
  description = "Mapa que associa o nome de cada droplet ao seu endereço IPv4 público"
  value       = { for d in digitalocean_droplet.web_droplet : d.name => d.ipv4_address }
  //value = digitalocean_droplet.web_droplet.*.ipv4_address
}

output "vpc_ip_range" {
  description = "Faixa de IP da VPC"
  value       = digitalocean_vpc.web_vpc.ip_range
}

output "ssh_key_fingerprint" {
  description = "Impressão digital (fingerprint) da chave SSH registrada"
  value       = digitalocean_ssh_key.web_ssh_key.fingerprint
}

output "load_balancer_pip" {
  description = "Endereço IP público do load balancer"
  value       = digitalocean_loadbalancer.web_lb.ip
}

output "record_name" {
  description = "Nome do registro A no DNS"
  value       = digitalocean_record.deepseek.fqdn
}