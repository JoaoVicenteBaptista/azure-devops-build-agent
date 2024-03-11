resource "hcloud_network" "network" {
  name     = "hc_private"
  ip_range = var.network_ip_range
}

resource "hcloud_network_subnet" "network_private_subnet_agent" {
  network_id   = hcloud_network.network.id
  type         = "cloud"
  network_zone = "eu-central"
  ip_range     = var.network_ip_range_agent
}


