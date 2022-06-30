/**
#################################################################################################################
*                                       Output Variable Section
#################################################################################################################
**/

/**
* Output Variable
* Element : Load Balancer
* Load Balancer IP and DNS for App, DB and Web Tier
* This variable will output the IP address and DNS for App, DB and Web
**/
output "LOAD_BALANCER" {
  description = "This variable will display the private and public IP addresses and DNS of load balancers"
  value = merge(
    { "PRIVATE_IP" = module.core_modules.lb_private_ip },
    { "PUBLIC_IP" = module.core_modules.lb_public_ip },
    { "DNS" = module.core_modules.lb_dns }
  )
}

/**
* Output Variable
* Element : Virtual Server Instance
* Virtual Server Instance Private IP Addresses for App, DB and Web
* This variable will output the IP addresses and DNS for App, DB and Web
**/
output "VSI" {
  description = "This variable will display the private IP addresses of App/Web/DB servers"
  value = merge(
    {
      "PRIVATE_IP" = merge(
        { "DB" = module.core_modules.db_target },
        { "App" = var.enable_autoscaling ? module.autoscale.app_instances_ip : module.core_modules.app_target },
        { "Web" = var.enable_autoscaling ? module.autoscale.web_instances_ip : module.core_modules.web_target }
      )
    },
  )
}

/**
* Output Variable
* Element : Virtual Server Instance
* This variable will output the Public IP address of Bastion server
**/
output "BASTION_PUBLIC_IP" {
  description = "This variable will display the public IP address of Bastion Server"
  value       = var.enable_floating_ip ? module.core_modules.bastion_ip : null
}