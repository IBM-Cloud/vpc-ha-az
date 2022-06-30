/**
#################################################################################################################
*                                       Output Variable Section
#################################################################################################################
**/

/**
* Output Variable
* Element : VPC
* This variable will output the VPC created
**/
output "vpc" {
  description = "This variable will display the vpc created"
  value       = ibm_is_vpc.vpc
}

/**
* Output Variable: sub_objects
* Element : sub_objects objects
* This variable will return the objects for the following subnets
* Objects: 
* app_subnet
* db_subnet
* web_subnet
**/
output "sub_objects" {
  description = "This output variable will expose the objects of all subnets"
  value = {
    "app" = ibm_is_subnet.app_subnet,
    "db"  = ibm_is_subnet.db_subnet,
    "web" = ibm_is_subnet.web_subnet
  }
}

/**
* Output Variable: sg_objects
* Element : sg_objects objects
* This variable will return the objects for the following subnets
* Objects: 
* app
* db
* lb
* web
**/
output "sg_objects" {
  description = "This output variable will expose the objects of all security groups"
  value = {
    "app" = ibm_is_security_group.app,
    "db"  = ibm_is_security_group.db,
    "lb"  = ibm_is_security_group.lb_sg,
    "web" = ibm_is_security_group.web
  }
}

/**
* Output Variable
* Element : Bastion IP
* Floating IP address for the Bastion VSI
* This variable will return array of IP address for the Bastion VSI
**/
output "bastion_ip" {
  value       = ibm_is_floating_ip.bastion_floating_ip.*.address
  description = "Bastion Server Floating IP Address"
  depends_on  = [ibm_is_instance.bastion, ibm_is_floating_ip.bastion_floating_ip]
}


/**
* Output Variable for Bastion Server Security Group
* This variable will return the Bastion Security Group ID 
**/
output "bastion_sg" {
  value       = ibm_is_security_group.bastion.id
  description = "Security Group id for the bastion"
}

/**
* Output Variable
* Element : DB Placement Group
* Placement group ID for Database servers
* This variable will return the ID of the DB Placement group
**/
output "db_pg_id" {
  value       = ibm_is_placement_group.db_placement_group.id
  description = "Placement group ID for Database servers"
}

/**
* Output Variable
* Element : Web Placement Group
* Placement group ID for Web servers
* This variable will return the ID of the Web Placement group
**/
output "web_pg_id" {
  value       = ibm_is_placement_group.web_placement_group.id
  description = "Placement group ID for Web servers"
}

/**
* Output Variable
* Element : App Placement Group
* Placement group ID for App servers
* This variable will return the ID of the App Placement group
**/
output "app_pg_id" {
  value       = ibm_is_placement_group.app_placement_group.id
  description = "Placement group ID for App servers"
}

/**
* Output Variable
* Element : bastion_key_id
* This variable will return the SSH key id created by Bastion server.
**/
output "bastion_key_id" {
  value       = data.ibm_is_ssh_key.bastion_key_id.id
  description = "This variable will return the SSH key id created by Bastion server"
}

/**
* Output Variable: objects
* Element : objects
* This variable will return the objects of LB, LB Pool and LB Listeners for app, db and web tiers.
**/
output "objects" {
  description = "This variable will contains the objects of LB, LB Pool and LB Listeners. "
  value = {
    "lb" = {
      "app" = ibm_is_lb.app_lb,
      "web" = ibm_is_lb.web_lb
    },
    "pool" = {
      "app" = ibm_is_lb_pool.app_pool,
      "web" = ibm_is_lb_pool.web_pool
    },
    "listener" = {
      "app" = ibm_is_lb_listener.app_listener,
      "web" = ibm_is_lb_listener.web_listener
    }
  }
}

/**
* Output Variable
* Element : Web Target
* Primary IP address for the web VSI
* This variable will return array of IP address for the Web VSI
**/
output "web_target" {
  value       = ibm_is_instance.web.*.primary_network_interface.0.primary_ipv4_address
  description = "Target primary network interface address"
  depends_on  = [ibm_is_instance.web]
}

/**
* Output Variable
* Element : App Target
* Primary IP address for the db VSI
* This variable will return array of IP address for the DB VSI
**/
output "app_target" {
  value       = ibm_is_instance.app.*.primary_network_interface.0.primary_ipv4_address
  description = "Target primary network interface address"
  depends_on  = [ibm_is_instance.app]
}

/**
* Output Variable
* Element : DB Target
* Primary IP address for the web VSI
* This variable will return array of IP address for the DB VSI
**/
output "db_target" {
  value       = ibm_is_instance.db.*.primary_network_interface.0.primary_ipv4_address
  description = "Target primary network interface address"
  depends_on  = [ibm_is_instance.db]
}

/**
* Output Variable
* Element : Compute instance
* This will return the db vsi reference
**/
output "db_vsi" {
  value       = ibm_is_instance.db
  description = "Target primary network interface address"
  depends_on  = [ibm_is_instance.db]
}

/**
* Output Variable
* Element : LB Public IP
* Public IP address for the Web Load Balancer
* This variable will return IP address for the Web Load Balancer
**/
output "lb_public_ip" {
  value = merge(
    { "WEB_SERVER" = ibm_is_lb.web_lb.public_ips }
  )
  description = "Public IP for Web Server"
}

/**
* Output Variable
* Element : LB Private IP
* Private IP address for the App and DB Load Balancer
* This variable will return IP address for the App and DB Load Balancer
**/
output "lb_private_ip" {
  value = merge(
    { "APP_SERVER" = ibm_is_lb.app_lb.private_ips },
  )
  description = "Private IP for App and DB Server"
}

/**
* Output Variable
* Element : LB DNS
* DNS address for the App, DB and Web Load Balancer
* This variable will return DNS for the App and DB Load Balancer
**/
output "lb_dns" {
  value = merge(
    { "APP_SERVER" = ibm_is_lb.app_lb.hostname },
    { "WEB_SERVER" = ibm_is_lb.web_lb.hostname }
  )
  description = "Private IP for App, DB and Web Server"
}

/**
* Output Variable for Bastion Server Subnet Details
* This variable will return the Subnet details of Bastion server
**/
output "bastion_sub_id" {
  value       = ibm_is_subnet.bastion_sub.id
  description = "Subnet details for the bastion server"
}
output "bastion_sub_cidr" {
  value       = ibm_is_subnet.bastion_sub.ipv4_cidr_block
  description = "Subnet details for the bastion server"
}