# Configure the Hetzner Cloud Provider
provider "hcloud" {
  token   = var.hcloud_token
}



module "ansible_server" {
  source = "./modules/ansible_server"

  os_type           = var.os_type
  server_type = var.server_type
  location = var.location
  hcloud_token= var.hcloud_token
  network_ip_range = var.network_ip_range
  server_private_network_ip = "10.0.1.2"

  hcloud_ssh_key_default_id = [hcloud_ssh_key.default.id]
  network_id = hcloud_network.network.id
  subnet_id = hcloud_network_subnet.network_private_subnet_management.id
  network_private_subnet = hcloud_network_subnet.network_private_subnet_management

  depends_on = [
    module.bastion_servers.bastion
  ]

}

module "bastion_servers" {
  source = "./modules/bastion"

  os_type           = var.os_type
  server_type = var.server_type
  location = var.location
  hcloud_token= var.hcloud_token
  network_ip_range = var.network_ip_range
  server_private_network_ip = "10.0.1.1"

  hcloud_ssh_key_default_id = [hcloud_ssh_key.default.id]
  network_id = hcloud_network.network.id
  subnet_id = hcloud_network_subnet.network_private_subnet_management.id
  network_private_subnet = hcloud_network_subnet.network_private_subnet_management

}

# module "backstage_servers" {
#   source = "./modules/backstage_server"

#   os_type           = var.os_type
#   server_type = var.server_type
#   location = var.location
#   hcloud_token= var.hcloud_token
#   network_ip_range = var.network_ip_range
#   server_private_network_ip = "10.0.1.3"

#   hcloud_ssh_key_default_id = [hcloud_ssh_key.default.id]
#   network_id = hcloud_network.network.id
#   subnet_id = hcloud_network_subnet.network_private_subnet_management.id
#   network_private_subnet = hcloud_network_subnet.network_private_subnet_management

# }


# module "web_server" {
#   source = "./modules/web_server"
#   name = "web-server-0"
#   os_type           = var.os_type
#   server_type = var.server_type
#   location = var.location
#   hcloud_token= var.hcloud_token
#   network_ip_range = var.network_ip_range

#   hcloud_ssh_key_default_id = [hcloud_ssh_key.default.id]
#   network_id = hcloud_network.network.id
#   subnet_id = hcloud_network_subnet.network_private_subnet_web.id
#   network_private_subnet = hcloud_network_subnet.network_private_subnet_web


# }

