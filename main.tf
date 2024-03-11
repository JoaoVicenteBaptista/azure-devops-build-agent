# Configure the Hetzner Cloud Provider
provider "hcloud" {
  token   = var.hcloud_token
}


module "agent_servers" {
  source = "./modules/agent"

  os_type           = var.os_type
  server_type = var.server_type
  location = var.location
  hcloud_token= var.hcloud_token
  network_ip_range = var.network_ip_range
  server_private_network_ip = "10.0.1.1"

  hcloud_ssh_key_default_id = [hcloud_ssh_key.default.id]
  network_id = hcloud_network.network.id
  subnet_id = hcloud_network_subnet.network_private_subnet_agent.id
  network_private_subnet = hcloud_network_subnet.network_private_subnet_agent

}


