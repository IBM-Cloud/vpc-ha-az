/**
* Output Variable
* Element : app_instances_ip
* Virtual Server Instance Private IP Addresses for App
**/
output "app_instances_ip" {
  value      = var.enable_autoscaling ? flatten(data.ibm_is_instances.app_ig_members[0].instances[*].primary_network_interface[0].primary_ipv4_address) : null
  depends_on = [data.ibm_is_instances.app_ig_members]
}

/**
* Output Variable
* Element : web_instances_ip
* Virtual Server Instance Private IP Addresses for Web
**/
output "web_instances_ip" {
  value      = var.enable_autoscaling ? flatten(data.ibm_is_instances.web_ig_members[0].instances[*].primary_network_interface[0].primary_ipv4_address) : null
  depends_on = [data.ibm_is_instances.web_ig_members]
}
