# terraform-examples

Examples of OpenStack terraform configurations

## Simple-webserver

-   Deploys N servers specified in local.instances
-   Starts an nginx webserver on each with cloud-init
-   Configures SSH port forwarding via LBaaS
-   Sets up an HTTP(S) Loadbalancer with Health Monitoring
-   Instances don't listen on HTTPS, so Health Manager will report them as degraded
