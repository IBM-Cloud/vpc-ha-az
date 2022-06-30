/**
#################################################################################################################
*                           Variable Section for the VPC Module.
*                           Start Here of the Variable Section 
#################################################################################################################
*/

variable "cos_validation" {
  description = "This variable will track cos variable validation checks"
  type        = any
}

/**
* Name: enable_autoscaling
* Type: bool
* Desc: Determines whether to enable IG or not. Give true or false.
**/
variable "enable_autoscaling" {
  description = "Determines whether to enable IG or not. Give true or false."
  type        = bool
}

/**
* Name: enable_automation
* Type: bool
* Desc: Determines whether to enable Automation or not. Give true or false.
**/
variable "enable_automation" {
  description = "Determines whether to enable Automation or not. Give true or false."
  type        = bool
}

/**
* Name: enable_public_gateway
* Type: bool
* Desc: Determines whether to create Public Gateway or not. Give true or false.
**/
variable "enable_public_gateway" {
  description = "Determines whether to create Public Gateway or not. Give true or false."
  type        = bool
}

/**
* Name: enable_vpn
* Type: bool
* Desc: Determines whether to create vpn or not. Give true or false.
**/
variable "enable_vpn" {
  description = "Determines whether to create vpn or not. Give true or false."
  type        = bool
}

/**
* Name: prefix
* Type: String
* Desc: This is the prefix text that will be prepended in every resource name created by this script.
**/
variable "prefix" {
  description = "Prefix for all the resources."
  type        = string
}
/**
* Name: resource_group_id
* Type: String
*/
variable "resource_group_id" {
  description = "Resource Group ID is used to seperate the resources in a group."
  type        = string
}

/**
  * IP Count for the subnets web, app and db tier
  * Value of ip_count will be from following 
  * 8, 16, 32, 64, 128, 256, 512, 1024, 2048, 4096, 8192 and 16384
  * Name: ip_count
  * Type: map(any)
  * Desc: This map contains total number of IP Address for each subnet present in each tier web, app and db
  */
variable "ip_count" {
  description = "This map contains total number of IP Address for each subnet present in each tier web, app and db"
  type        = map(any)
}

/**
* Name: zone
* Desc: The zone where the subnet will be created
* Type: string
**/
variable "zone" {
  description = "The zone where the subnet will be created"
  type        = string
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
* Name: tags
* Type: list(string)
* Desc: A list of tags that will be attached to resources created by the script.
*/
variable "tags" {
  description = "A list of tags that will be attached to resources created by the script."
  type        = list(string)
}

/**
* Name: public_gateway_id
* Desc: Id of the public gateway where subnets will get attached
* Type: list(any)
**/
variable "public_gateway_id" {
  description = "Id of the public gateway where subnets will get attached"
  type        = string
}

/**               
#################################################################################################################
*                                   End of the Variable Section 
#################################################################################################################
**/