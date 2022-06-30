###################################################################################################
###################################################################################################
#####         This Terraform file defines the variables used in Load Balancer Module         ######
#####                                     Load Balancer Module                               ######
###################################################################################################
###################################################################################################

/**
* Name: lb_protocol, lb_algo, lb_protocol_value & lb_algo_value
* Desc: LBaaS Protocols & LBaaS backend distribution algorithm
**/
locals { // put on top
  lb_protocol = {
    "http"  = "http"
    "https" = "https"
    "tcp"   = "tcp"
  }
  lb_algo = {
    "round_robin"          = "round_robin"
    "weighted_round_robin" = "weighted_round_robin"
    "least_connections"    = "least_connections"
  }
  alb_port          = 80            # App load balancer listener port
  wlb_port          = 80            # Web load balancer listener port
  app_lb_type       = "private"     #This local variable will hold the App Load Balancer type as private
  lb_protocol_value = "http"        #LBaaS Protocols. The protocol could be any of these values: http, https, tcp. Default Value: http
  lb_algo_value     = "round_robin" #LBaaS backend distribution algorithm. The algorithm could be any of the values: round_robin, weighted_round_robin, least_connections. Default Value: round_robin
}

/**
* Name: app_lb_type
* Desc: This variable will decide the type of App Load Balancer. Allowed values are public or private.
* Type: String
**/
variable "app_lb_type" {
  description = "This variable will decide the type of App Load Balancer. Allowed values are public or private."
  type        = string
  default     = "private"
  validation {
    condition     = contains(["public", "private"], var.app_lb_type)
    error_message = "Error: Incorrect value for App Load Balancer type. Allowed values are public and private."
  }
}

/**
* Name: web_lb_type
* Desc: This variable will decide the type of Web Load Balancer. Allowed values are public or private.
* Type: String
**/
variable "web_lb_type" {
  description = "This variable will decide the type of Web Load Balancer. Allowed values are public or private."
  type        = string
  validation {
    condition     = contains(["public", "private"], var.web_lb_type)
    error_message = "Error: Incorrect value for Web Load Balancer type. Allowed values are public and private."
  }
}

/**
* Name: lb_port_number
* Type: map(any)
* Desc: Declare LBaaS pool member port number
**/
variable "lb_port_number" {
  description = "declare LBaaS pool member port number"
  type        = map(any)
  default = {
    "http"   = "80"
    "https"  = "443"
    "custom" = "xxx"
  }
}

/**               
#################################################################################################################
*                                   End of the Variable Section 
#################################################################################################################
**/