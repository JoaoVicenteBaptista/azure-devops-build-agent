variable "project_name"{
  default = "azure-devops-build-agent"
}
variable "env"{
  default = "poc"
}

variable "hcloud_token" {
  default = ""
}

variable "location" {
  default = "nbg1"
}


variable "server_type" {
  default = "CX21"
}

variable "os_type" {
  default = "ubuntu-22.04"
}

variable "network_ip_range" {
  default = "10.0.0.0/16"
}

variable "network_ip_range_agent" {
  default = "10.0.1.0/24"
}
