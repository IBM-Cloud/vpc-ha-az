###################################################################################################
###################################################################################################
#####                This Terraform file defines the variables used in All Modules           ######
#####                                      All Modules                                       ######
###################################################################################################
###################################################################################################

/**
* Name: enable_autoscaling
* Type: bool
* Desc: Determines whether to enable autoscaling or not. Enter true or false.
**/
variable "enable_autoscaling" {
  description = "Determines whether to enable autoscaling or not. Enter true or false."
  type        = bool
}

/**
* Name: enable_automation
* Type: bool
* Desc: Determines whether to enable Automation or not. Enter true or false.
**/
variable "enable_automation" {
  description = "Determines whether to enable Automation or not. Enter true or false."
  type        = bool
}

/**
* Name: enable_public_gateway
* Type: bool
* Desc: Determines whether to create Public Gateway or not. Enter true or false.
**/
variable "enable_public_gateway" {
  description = "Determines whether to create Public Gateway or not. Enter true or false."
  type        = bool
}

/**
* Name: enable_cos
* Type: bool
* Desc: Determines whether to create Cloud Object Storage [COS]. Enter true or false.
**/
variable "enable_cos" {
  description = "Determines whether to create Cloud Object Storage [COS]. Enter true or false."
  type        = bool
}

/**
* Name: enable_floating_ip
* Type: bool
* Desc: Determines whether to enable floating IP for Bastion server or not. Enter true or false.
**/
variable "enable_floating_ip" {
  description = "Determines whether to enable floating IP for Bastion server or not. Enter true or false."
  type        = bool
  default     = true
}

/**
* Name: enable_vpn
* Type: bool
* Desc: Determines whether to create vpn or not. Enter true or false.
**/
variable "enable_vpn" {
  description = "Determines whether to create vpn or not. Enter true or false."
  type        = bool
}

/**
* Name: alb_port
* Type: number
* Desc: This is the Application load balancer listener port
**/
variable "alb_port" {
  description = "This is the Application load balancer listener port"
  type        = number
  default     = 80
}

/**
* Name: zone
* Type: String
* Desc: Zone to be used for resources creation
*/
variable "zone" {
  description = "Please enter a zone to be used for resources creation"
  type        = string
}

/**
* Name: api_key
* Type: String
* Desc: Please enter the IBM Cloud API key
*/
variable "api_key" {
  description = "Please enter the IBM Cloud API key."
  type        = string
  sensitive   = true
}

/**
* Name: resource_group_id
* Type: String
* Desc: Resource Group ID to be used for resources creation
*/
variable "resource_group_id" {
  description = "Resource Group ID"
  type        = string
  validation {
    condition     = length(var.resource_group_id) == 32
    error_message = "Length of Resource Group ID should be 32 characters."
  }
}

/**
* Name: prefix
* Type: String
* Desc: This is the prefix text that will be prepended in every resource name created by this script.
**/
variable "prefix" {
  description = "This is the prefix text that will be prepended in every resource name created by this script."
  type        = string
  validation {
    condition     = length(var.prefix) <= 11
    error_message = "Length of prefix should be less than 11 characters."
  }
  validation {
    condition     = can(regex("^[A-Za-z][-0-9A-Za-z]*-$", var.prefix))
    error_message = "For the prefix value only a-z, A-Z and 0-9 are allowed, the prefix should start with a character, and the prefix should end a with hyphen(-)."
  }
}

/**
* Name: web_max_servers_count
* Type: number
* Desc: Maximum Web servers count for the Web Instance group
**/
variable "web_max_servers_count" {
  description = "Maximum Web servers count for the Web Instance group"
  type        = number
  validation {
    condition     = var.web_max_servers_count >= 1 && var.web_max_servers_count <= 1000
    error_message = "Error: Incorrect value for web_max_servers_count. Allowed value should be between 1 and 1000."
  }
}

/**
* Name: app_max_servers_count
* Type: number
* Desc: Maximum App servers count for the App Instance group
**/
variable "app_max_servers_count" {
  description = "Maximum App servers count for the App Instance group"
  type        = number
  validation {
    condition     = var.app_max_servers_count >= 1 && var.app_max_servers_count <= 1000
    error_message = "Error: Incorrect value for app_max_servers_count. Allowed value should be between 1 and 1000."
  }
}

/**
* Name: regions
* Type: map(any)
* Desc: Region and zones mapping
**/
variable "regions" {
  description = "Region and Zones mapping"
  type        = map(any)
  default = {
    "us-south-1" = "us-south" #Dallas
    "us-south-2" = "us-south"
    "us-south-3" = "us-south"
    "us-east-1"  = "us-east" #Washington DC
    "us-east-2"  = "us-east"
    "us-east-3"  = "us-east"
    "eu-gb-1"    = "eu-gb" #London
    "eu-gb-2"    = "eu-gb"
    "eu-gb-3"    = "eu-gb"
    "eu-de-1"    = "eu-de" #Frankfurt
    "eu-de-2"    = "eu-de"
    "eu-de-3"    = "eu-de"
    "jp-tok-1"   = "jp-tok" #Tokyo
    "jp-tok-2"   = "jp-tok"
    "jp-tok-3"   = "jp-tok"
    "au-syd-1"   = "au-syd" #Sydney
    "au-syd-2"   = "au-syd"
    "au-syd-3"   = "au-syd"
    "jp-osa-1"   = "jp-osa" #Osaka
    "jp-osa-2"   = "jp-osa"
    "jp-osa-3"   = "jp-osa"
    "br-sao-1"   = "br-sao" #Sao Paulo
    "br-sao-2"   = "br-sao"
    "br-sao-3"   = "br-sao"
    "ca-tor-1"   = "ca-tor" #Toronto
    "ca-tor-2"   = "ca-tor"
    "ca-tor-3"   = "ca-tor"
  }
}

/**
* Name: tags
* Type: list(string)
* Desc: A list of tags that will be attached to resources created by the script.
*/
variable "tags" {
  description = "A list of tags that will be attached to resources created by the script."
  type        = list(string)
}