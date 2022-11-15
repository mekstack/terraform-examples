locals {
  instances = ["web1", "web2", "web3"]
  port_forwards = [
    for instance in local.instances :
    {
      name       = "SSH for ${instance}"
      protocol   = "TCP"
      dst_port   = index(local.instances, instance) + 2200
      to_port    = 22
      to_address = openstack_compute_instance_v2.instance[instance].network[0].fixed_ip_v4
    }
  ]
  web_lb_ports = [
    {
      name = "HTTP"
      port = 80
    },
    {
      name = "HTTPS"
      port = 443
    }
  ]
}
