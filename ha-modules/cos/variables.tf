/**
#################################################################################################################
*                           Variable Section for the Cos Bucket Module.
*                                 Start Here of the Variable Section 
#################################################################################################################
*/

/**
* Name: vpc
* Type: any
* Desc: Required parameter vpc
**/
variable "vpc" {
  description = "Required parameter vpc"
  type        = any
}

/**
* Name: enable_cos
* Type: bool
* Desc: Determines whether to create COS bucket or not. Enter true or false.
**/
variable "enable_cos" {
  description = "Determines whether to create COS bucket or not. Enter true or false."
  type        = bool
}

/**
* Name: prefix
* Type: String
* Desc: This is the prefix text that will be prepended in every resource's name created by this script.
**/
variable "prefix" {
  description = "Prefix for all the resources."
  type        = string
}

/**
* Name: zone
* Type: string
* Desc: Resources will be created in the user specified zone
**/
variable "zone" {
  description = "Resources will be created in the user specified zone"
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
* Name: resource_group_id
* Type: String
*/
variable "resource_group_id" {
  description = "Resource Group ID is used to separate the resources in a group."
  type        = string
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
* Name: cos_bucket_plan
* Type: String
* Desc: List of available plan for the COS bucket. 
* Followings are the list of available plan.
* 1. lite
* 2. standard
**/
variable "cos_bucket_plan" {
  description = "Please enter plan name for COS bucket. Possible value is \n1:lite\n2:standard"
  type        = string
}


/**
* Name: cross_region_location
* Type: String
* Desc: Cross Region service provides higher durability and availability than using a single region, 
* at the cost of slightly higher latency. This service is available today in the U.S., E.U., and A.P. areas. 
* Followings are the list of available cross_region_location as of now.
* 1. us
* 2. eu
* 3. ap 
**/
variable "cross_region_location" {
  description = "Cross Region service provides higher durability and availability than using a single region, at the cost of slightly higher latency. This service is available today in the U.S., E.U., and A.P. areas."
  type        = string
}


/**
* Name: storage_class
* Type: String
* Desc: Storage class helps in choosing a right storage plan and location and helps in reducing the cost. 
* Followings are the list of available storage_class as of now.
* 1. Smart Tier
* 2. Standard
* 3. Vault
* 4. Cold Vault
* Note: Flex has been replaced by Smart Tier for dynamic workloads. 
* Flex users can continue to manage their data in existing Flex buckets, although no new Flex buckets may be created. Existing users can reference pricing information
**/
variable "storage_class" {
  description = "Storage class helps in choosing a right storage plan and location and helps in reducing the cost."
  type        = string
}

/**
* Name: bucket_location
* Type: String
* Desc: The location of the COS bucket. 
**/
variable "bucket_location" {
  description = "The location of the COS bucket"
  type        = string
}

/**
* Name: obj_key
* Type: String
* Desc: The name of an object in the COS bucket. This is used to identify our object. 
**/
variable "obj_key" {
  description = "The name of an object in the COS bucket. This is used to identify our object."
  type        = string
}

/**
* Name: obj_content
* Type: String
* Desc:  Literal string value to use as an object content, which will be uploaded as UTF-8 encoded text. Conflicts with content_base64 and content_file. 
**/
variable "obj_content" {
  description = "Literal string value to use as an object content, which will be uploaded as UTF-8 encoded text. Conflicts with content_base64 and content_file"
  type        = string
}

/**               
#################################################################################################################
*                                   End of the Variable Section 
#################################################################################################################
**/
