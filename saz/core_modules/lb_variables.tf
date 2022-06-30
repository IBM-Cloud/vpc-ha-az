/**
#################################################################################################################
*                           Variable Section for the Load Balancer Module.
*                                 Start Here for the Variable Section 
#################################################################################################################
*/

/**
* Name: app_lb_type
* Desc: This variable will decide the type of App Load Balancer. Allowed values are public or private.
* Type: String
**/
variable "app_lb_type" {
  description = "This variable will decide the type of App Load Balancer. Allowed values are public or private."
  type        = string
}

/**
* Name: web_lb_type
* Desc: This variable will decide the type of Web Load Balancer. Allowed values are public or private.
* Type: String
**/
variable "web_lb_type" {
  description = "This variable will decide the type of Web Load Balancer. Allowed values are public or private."
  type        = string
}

/**
* Name: wlb_port
* Type: number
* Desc: This is the Web load balancer listener port
**/
variable "wlb_port" {
  description = "This is the Web load balancer listener port"
  type        = number
}

/**
* Name: alb_port
* Type: number
* Desc: This is the Application load balancer listener port
**/
variable "alb_port" {
  description = "This is the Application load balancer listener port"
  type        = number
}

/**
* Name: lb_protocol
* Type: map(any)
* Desc: lbaas Protocols
**/
variable "lb_protocol" {
  description = "lbaaS protocols"
  type        = map(any)
}

/**
* Name: lb_algo
* Type: map(any)
* Desc: lbaaS backend distribution algorithm
**/
variable "lb_algo" {
  description = "lbaaS backend distribution algorithm"
  type        = map(any)
}

/**
* Name: lb_port_number
* Type: map(any)
* Desc: Declare lbaaS pool member port number
**/
variable "lb_port_number" {
  description = "declare lbaaS pool member port number"
  type        = map(any)
}

/**
* Name: lb_protocol_value
* Type: string
* Desc: lbaas Protocols
**/
variable "lb_protocol_value" {
  description = "lbaas Protocols \nThe protocol could be any of the values: http, https, tcp. \nDefault Value: http"
  type        = string
}

/**
* Name: lb_algo_value
* Type: string
* Desc: lbaaS backend distribution algorithm
**/
variable "lb_algo_value" {
  description = "lbaaS backend distribution algorithm. \nThe algorithm could be any of the values: round_robin, weighted_round_robin, least_connections. \nDefault Value: round_robin"
  type        = string
}

/**               
#################################################################################################################
*                                   End of the Variable Section 
#################################################################################################################
**/
