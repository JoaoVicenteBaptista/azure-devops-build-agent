resource "hcloud_ssh_key" "default" {
  name       = "hetzner_key"
  public_key = file("c:/users/joaob/.ssh/tf_hetzner.pub")
}