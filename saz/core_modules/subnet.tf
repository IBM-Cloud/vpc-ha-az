/**
#################################################################################################################
*                           Resources Section for the Subnets Module.
#################################################################################################################
*/

/**
* Subnet for Web Servers
* Element : web_subnet
* This resource will be used to create a subnet for Web Servers.
**/
resource "ibm_is_subnet" "web_subnet" {
  name                     = "${var.prefix}${var.zone}-web"
  vpc                      = ibm_is_vpc.vpc.id
  resource_group           = var.resource_group_id
  zone                     = var.zone
  total_ipv4_address_count = var.ip_count["web"]
  public_gateway           = var.public_gateway_id
  tags                     = var.tags
  depends_on = [
    ibm_is_placement_group.web_placement_group, ibm_is_security_group_rule.web_outbound, ibm_is_security_group_rule.web_rule_80, ibm_is_security_group_rule.web_rule_443, ibm_is_security_group_rule.web_rule_22,
  ]
}

/**
* Subnet for App Servers
* Element : app_subnet
* This resource will be used to create a subnet for App Servers.
**/
resource "ibm_is_subnet" "app_subnet" {
  name                     = "${var.prefix}${var.zone}-app"
  vpc                      = ibm_is_vpc.vpc.id
  resource_group           = var.resource_group_id
  zone                     = var.zone
  total_ipv4_address_count = var.ip_count["app"]
  public_gateway           = var.public_gateway_id
  tags                     = var.tags
  depends_on = [
    ibm_is_placement_group.app_placement_group, ibm_is_security_group_rule.app_outbound, ibm_is_security_group_rule.app_rule_lb_listener, ibm_is_security_group_rule.app_rule_80, ibm_is_security_group_rule.app_rule_22, ibm_is_security_group_rule.db_rule_22, ibm_is_security_group_rule.db_rule_80, ibm_is_security_group_rule.db_rule_app_3306, ibm_is_security_group_rule.db_rule_web_3306, ibm_is_security_group_rule.db_outbound, ibm_is_security_group_rule.lb_inbound, ibm_is_security_group_rule.lb_outbound
  ]
}

/**
* Subnet for DB Servers
* Element : db_subnet
* This resource will be used to create a subnet for DB Servers.
**/
resource "ibm_is_subnet" "db_subnet" {
  name                     = "${var.prefix}${var.zone}-db"
  vpc                      = ibm_is_vpc.vpc.id
  resource_group           = var.resource_group_id
  zone                     = var.zone
  total_ipv4_address_count = var.ip_count["db"]
  public_gateway           = var.public_gateway_id
  tags                     = var.tags
}
