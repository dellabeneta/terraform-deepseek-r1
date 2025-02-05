variable "certificate_name" {
  description = "Nome do certificado digital já existente na DigitalOcean"
  type        = string
}

variable "do_token" {
  description = "Token da API do Digital Ocean"
  type        = string
  sensitive   = true
}

variable "domain_name" {
  description = "Nome do domínio"
  type        = string
}

variable "droplet_count" {
  description = "Número de droplets a serem criados"
  type        = number
}

variable "droplet_image" {
  description = "Imagem do droplet"
  type        = string
}

variable "droplet_size" {
  description = "Tamanho do droplet"
  type        = string
}

variable "env_prefix" {
  description = "Prefixo do ambiente para diferenciar os recursos (ex.: tst, stg, prd)"
  type        = string
}

variable "env_region" {
  description = "Região da VPC"
  type        = string
}

variable "record_name" {
  description = "Nome que o registro A será criado"
  type        = string
}

variable "ssh_key_path" {
  description = "Caminho para a chave pública SSH"
  type        = string
}

variable "vpc_ip_range" {
  description = "Faixa de IP da VPC"
  type        = string
}
