/**
#################################################################################################################
*                   Resources Section of the Security Group Module for Web Tier
#################################################################################################################
*/

/**
* Security Group for Web Server
* Defining resource "Security Group". This will be responsible to handle security for the 
* Web Server
**/
resource "ibm_is_security_group" "web" {
  name           = "${var.prefix}web-sg"
  vpc            = ibm_is_vpc.vpc.id
  resource_group = var.resource_group_id
  tags           = var.tags
}

# /**
# *
# #                             Security Group Rules for the Web Server
# *
# */

/**
* Security Group Rule for Web Server
* This inbound rule will allow the Bastion server to ssh connect to the Web server on port 22.
**/
resource "ibm_is_security_group_rule" "web_rule_22" {
  group     = ibm_is_security_group.web.id
  direction = "inbound"
  remote    = ibm_is_security_group.bastion.id
  tcp {
    port_min = "22"
    port_max = "22"
  }
}

/**
* Security Group Rule for Web Server
* This inbound rule will allow the Load Balancer to access the Web servers on the 80 port. We can change this port as per the requirement.
**/
resource "ibm_is_security_group_rule" "web_rule_80" {
  group     = ibm_is_security_group.web.id
  direction = "inbound"
  remote    = ibm_is_security_group.lb_sg.id

  tcp {
    port_min = "80"
    port_max = "80"
  }
}

/**
* Security Group Rule for Web Server
* This inbound rule will allow the Load Balancer to access the Web servers on the 443 port. We can change this port as per the requirement.
**/
resource "ibm_is_security_group_rule" "web_rule_443" {
  group     = ibm_is_security_group.web.id
  direction = "inbound"
  remote    = ibm_is_security_group.lb_sg.id
  tcp {
    port_min = "443"
    port_max = "443"
  }
}

/**
* Security Group Rule for Web Server
* This will allow all the outbound traffic from the Web servers. Inbound traffics are restricted though, as specified in above rules.
**/
resource "ibm_is_security_group_rule" "web_outbound" {
  group     = ibm_is_security_group.web.id
  direction = "outbound"
  remote    = "0.0.0.0/0"
}

/**
#################################################################################################################
*                      Resources Section of the Security Group Module for App Tier
#################################################################################################################
*/

/**
* Security Group for App Server
* Defining resource "Security Group". This will be responsible to handle security for the 
* App Server
**/
resource "ibm_is_security_group" "app" {
  name           = "${var.prefix}app-sg"
  vpc            = ibm_is_vpc.vpc.id
  resource_group = var.resource_group_id
  tags           = var.tags
}

/**
*
#                             Security Group Rules for the App Server
*
*/

/**
* Security Group Rule for App Server
* This inbound rule will allow the Bastion server to ssh connect to the App server on port 22.
**/
resource "ibm_is_security_group_rule" "app_rule_22" {
  group     = ibm_is_security_group.app.id
  direction = "inbound"
  remote    = ibm_is_security_group.bastion.id
  tcp {
    port_min = "22"
    port_max = "22"
  }
}

/**
* Security Group Rule for App Server
* This inbound rule will allow the Load Balancer to access the App servers on the Application load balancer listener port
**/
resource "ibm_is_security_group_rule" "app_rule_lb_listener" {
  group     = ibm_is_security_group.app.id
  direction = "inbound"
  remote    = ibm_is_security_group.lb_sg.id

  tcp {
    port_min = var.alb_port
    port_max = var.alb_port
  }
}

/**
* Security Group Rule for App Server
* This is the temporary rule added to check the telnet connection from web to app server.
* We need to modify the port later with the required port number
**/
resource "ibm_is_security_group_rule" "app_rule_80" {
  group     = ibm_is_security_group.app.id
  direction = "inbound"
  remote    = ibm_is_security_group.web.id
  tcp {
    port_min = "80"
    port_max = "80"
  }
}

/**
* Security Group Rule for App Server
* This will allow all the outbound traffic from the App servers. Inbound traffics are restricted though, as specified in above rules.
**/
resource "ibm_is_security_group_rule" "app_outbound" {
  group     = ibm_is_security_group.app.id
  direction = "outbound"
  remote    = "0.0.0.0/0"
}

/**
#################################################################################################################
*                  Resources Section of the Security Group Module for DB Tier
#################################################################################################################
*/

/**
* Security Group for DB Server
* Defining resource "Security Group". This will be responsible to handle security for the 
* DB Server
**/
resource "ibm_is_security_group" "db" {
  name           = "${var.prefix}db-sg"
  vpc            = ibm_is_vpc.vpc.id
  resource_group = var.resource_group_id
  tags           = var.tags
}
# /**
# *
# #                             Security Group Rules for the DB Server
# *
# */

/**
* Security Group Rule for DB Server
* This inbound rule will allow the Bastion server to ssh connect to the DB server on port 22.
**/
resource "ibm_is_security_group_rule" "db_rule_22" {
  group     = ibm_is_security_group.db.id
  direction = "inbound"
  remote    = ibm_is_security_group.bastion.id
  tcp {
    port_min = "22"
    port_max = "22"
  }
}

/**
* Security Group for DB Server
* This is the temporary rule added to check the telnet connection from App to DB server.
* We need to modify the port later with the required port
**/
resource "ibm_is_security_group_rule" "db_rule_80" {
  group     = ibm_is_security_group.db.id
  direction = "inbound"
  remote    = ibm_is_security_group.app.id
  tcp {
    port_min = "80"
    port_max = "80"
  }
}

# /**
# * TODO, Need to remove it, this is for the testing purpose
# * Security Group for DB Server
# * This is the sg rule added to check the connection from App to DB server where the mariadb service running on 3306.
# **/
resource "ibm_is_security_group_rule" "db_rule_app_3306" {
  group     = ibm_is_security_group.db.id
  direction = "inbound"
  remote    = ibm_is_security_group.app.id
  tcp {
    port_min = "3306"
    port_max = "3306"
  }
}


/**
* TODO, Need to remove it, this is for the testing purpose
* Security Group for DB Server
* This is the sg rule added to check the connection from Web to DB server where the mariadb service running on 3306.
**/
resource "ibm_is_security_group_rule" "db_rule_web_3306" {
  group     = ibm_is_security_group.db.id
  direction = "inbound"
  remote    = ibm_is_security_group.web.id
  tcp {
    port_min = "3306"
    port_max = "3306"
  }
}


/**
* Security Group Rule for DB Server
* This will allow all the outbound traffic from the DB servers. Inbound traffics are restricted though, as specified in above rules.
**/
resource "ibm_is_security_group_rule" "db_outbound" {
  group     = ibm_is_security_group.db.id
  direction = "outbound"
  remote    = "0.0.0.0/0"
}

/**
#################################################################################################################
*                   Resources Section of the Security Group Module for LB Tier
#################################################################################################################
*/

/**
* Security Group for Load Balancer
* Defining resource "Security Group". This will be responsible to handle security for the 
* Load Balancer
**/
resource "ibm_is_security_group" "lb_sg" {
  name           = "${var.prefix}lb-sg"
  vpc            = ibm_is_vpc.vpc.id
  resource_group = var.resource_group_id
  tags           = var.tags
}

# /**
# *
# #                             Security Group Rules for the Load Balancer
# *
# */

/**
* Security Group Rule for Load Balancer
* This will allow all the inbound traffic to the Load Balancers.
**/
resource "ibm_is_security_group_rule" "lb_inbound" {
  group      = ibm_is_security_group.lb_sg.id
  direction  = "inbound"
  remote     = "0.0.0.0/0"
  depends_on = [ibm_is_security_group.lb_sg]
}
/**
* Security Group Rule for Load Balancer
* This will allow all the outbound traffic from the Load Balancers.
**/
resource "ibm_is_security_group_rule" "lb_outbound" {
  group      = ibm_is_security_group.lb_sg.id
  direction  = "outbound"
  remote     = "0.0.0.0/0"
  depends_on = [ibm_is_security_group.lb_sg]
}
