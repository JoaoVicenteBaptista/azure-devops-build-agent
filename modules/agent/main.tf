

data "cloudinit_config" "agent_server_config" {
  gzip          = false
  base64_encode = true

  part {
    content_type = "text/cloud-config"
    content = templatefile("${path.module}/agent_servers_user_data.yml", {
      ssh_public_key: file("~/.ssh/tf_hetzner.pub")
      network_ip_range: var.network_ip_range
    })
  }
  part {
    content_type = "text/cloud-config"
    content = yamlencode({
      write_files = [
        {
          encoding    = "b64"
          content     = filebase64("~/.ssh/tf_hetzner")
          path        = "/home/devops/.ssh/tf_hetzner"
          owner       = "devops:devops"
          permissions = "0600"
          defer = true
        },
        
      ]
    })
  }
  
}

resource "hcloud_server" "agent" {
  name        = "agent"
  image       = var.os_type
  server_type = var.server_type
  location    = var.location
  ssh_keys    = var.hcloud_ssh_key_default_id
  
  labels = {
    type = "agent"
  }
  
  public_net {
    ipv4_enabled = true
    ipv6_enabled = true
  }
  
  network {
    network_id = var.network_id
    ip = var.server_private_network_ip
  }
  
  depends_on = [
    var.network_private_subnet
  ]
  
  user_data = data.cloudinit_config.bastion_server_config.rendered
  

}

resource "hcloud_server_network" "agent_subnet" {
  server_id  = hcloud_server.bastion.id
  subnet_id = var.subnet_id

  depends_on = [
    var.network_private_subnet
  ]
}

