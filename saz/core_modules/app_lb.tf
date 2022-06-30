/**
#################################################################################################################
*
*                               Load Balancer Section for App Tier
*                                 Start Here for the App LB Section 
*
#################################################################################################################
*/

/**
* App Load Balancer
* Element : app_lb
* This resource will create the Private App Load Balancer for App servers
* This will balance load between all the app servers
**/
resource "ibm_is_lb" "app_lb" {
  name            = "${var.prefix}app-lb"
  resource_group  = var.resource_group_id
  type            = var.app_lb_type
  subnets         = [ibm_is_subnet.app_subnet.id]
  security_groups = [ibm_is_security_group.lb_sg.id]
  tags            = var.tags
}

/**
* App Load Balancer Pool
* Element : app_pool
* This resource will create the App Loadbalancer Pool
**/
resource "ibm_is_lb_pool" "app_pool" {
  lb                  = ibm_is_lb.app_lb.id
  name                = "${var.prefix}app-pool"
  protocol            = var.lb_protocol[var.lb_protocol_value]
  algorithm           = var.lb_algo[var.lb_algo_value]
  health_delay        = "5"
  health_retries      = "2"
  health_timeout      = "2"
  health_type         = var.lb_protocol[var.lb_protocol_value]
  health_monitor_url  = "/"
  health_monitor_port = var.alb_port
  depends_on          = [ibm_is_lb.app_lb]
}

/**
* App Load Balancer Listener
* Element : app_listener
* This resource will create the App Loadbalancer Listener
**/
resource "ibm_is_lb_listener" "app_listener" {
  lb           = ibm_is_lb.app_lb.id
  protocol     = var.lb_protocol[var.lb_protocol_value]
  port         = var.alb_port
  default_pool = ibm_is_lb_pool.app_pool.pool_id
  depends_on   = [ibm_is_lb.app_lb, ibm_is_lb_pool.app_pool]
}

/**
* Load Balancer Pool Member For App VSIs
**/
resource "ibm_is_lb_pool_member" "app_lb_member" {
  count          = var.enable_autoscaling ? 0 : var.app_max_servers_count
  lb             = ibm_is_lb.app_lb.id
  pool           = ibm_is_lb_pool.app_pool.id
  port           = var.lb_port_number["http"]
  target_address = element(ibm_is_instance.app.*.primary_network_interface.0.primary_ipv4_address, count.index)
  depends_on     = [ibm_is_lb_listener.app_listener]
}

# /**               
# #################################################################################################################
# *                              End of the App Load Balancer Section 
# #################################################################################################################
# **/

