env_prefix    = "stg"
env_region    = "nyc1"
droplet_count = 2
droplet_image = "ubuntu-24-04-x64"
droplet_size  = "s-2vcpu-2gb"
vpc_ip_range  = "10.2.2.0/24"
record_name   = "stg"

ssh_key_path = "~/.ssh/stg/id_ed25519.pub"