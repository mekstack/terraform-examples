resource "openstack_networking_network_v2" "network" {
  name                  = "test-webserver network"
  admin_state_up        = true
  port_security_enabled = true
}

resource "openstack_networking_subnet_v2" "subnet" {
  name       = "test-webserver subnet"
  network_id = openstack_networking_network_v2.network.id
  cidr       = "10.69.69.0/24"
  ip_version = 4
}

data "openstack_networking_network_v2" "public" {
  name = "miem"
}

resource "openstack_networking_router_v2" "router" {
  name                = "test-webserver router"
  external_network_id = data.openstack_networking_network_v2.public.id
}

resource "openstack_networking_router_interface_v2" "router_interface" {
  router_id = openstack_networking_router_v2.router.id
  subnet_id = openstack_networking_subnet_v2.subnet.id
}
