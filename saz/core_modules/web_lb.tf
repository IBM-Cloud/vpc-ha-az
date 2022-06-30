/**
#################################################################################################################
*
*                               Load Balancer Section for Web Tier
*                                 Start Here for the Web LB Section 
*
#################################################################################################################
*/

/**
* Web Load Balancer
* Element : web_lb
* This resource will create the Public Web Load Balancer for Web servers
* This will balance load between all the web servers
**/
resource "ibm_is_lb" "web_lb" {
  name            = "${var.prefix}web-lb"
  resource_group  = var.resource_group_id
  type            = var.web_lb_type
  subnets         = [ibm_is_subnet.web_subnet.id]
  security_groups = [ibm_is_security_group.lb_sg.id]
  tags            = var.tags
}

/**
* Web Load Balancer Pool
* Element : web_pool
* This resource will create the Web Loadbalancer Pool
**/
resource "ibm_is_lb_pool" "web_pool" {
  lb                  = ibm_is_lb.web_lb.id
  name                = "${var.prefix}web-pool"
  protocol            = var.lb_protocol[var.lb_protocol_value]
  algorithm           = var.lb_algo[var.lb_algo_value]
  health_delay        = "5"
  health_retries      = "2"
  health_timeout      = "2"
  health_type         = var.lb_protocol[var.lb_protocol_value]
  health_monitor_url  = "/wp-admin/install.php"
  health_monitor_port = var.wlb_port
  depends_on          = [ibm_is_lb.web_lb]
}

/**
* Web Load Balancer Listener
* Element : web_listener
* This resource will create the Web Loadbalancer Listener
**/
resource "ibm_is_lb_listener" "web_listener" {
  lb           = ibm_is_lb.web_lb.id
  protocol     = var.lb_protocol[var.lb_protocol_value]
  port         = var.wlb_port
  default_pool = ibm_is_lb_pool.web_pool.pool_id
  depends_on   = [ibm_is_lb.web_lb, ibm_is_lb_pool.web_pool]
}

/**
* Load Balancer Pool Member For Web VSIs
**/
resource "ibm_is_lb_pool_member" "web_lb_member" {
  count          = var.enable_autoscaling ? 0 : var.app_max_servers_count
  lb             = ibm_is_lb.web_lb.id
  pool           = ibm_is_lb_pool.web_pool.id
  port           = var.lb_port_number["http"]
  target_address = element(ibm_is_instance.web.*.primary_network_interface.0.primary_ipv4_address, count.index)
  depends_on     = [ibm_is_lb_listener.web_listener]
}

# /**               
# #################################################################################################################
# *                              End of the Web Load Balancer Section 
# #################################################################################################################
# **/

