resource "openstack_compute_instance_v2" "instance" {
  for_each        = toset(local.instances)
  name            = each.key
  flavor_name     = "m2s.small"
  key_pair        = "admins"
  security_groups = ["octavia-test"]
  user_data       = file("${path.module}/user-data.yaml")
  image_name      = "Ubuntu focal"

  network {
    uuid        = openstack_networking_network_v2.network.id
    fixed_ip_v4 = "10.69.69.${index(local.instances, each.key) + 10}"
  }
}
