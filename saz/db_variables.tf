###################################################################################################
###################################################################################################
#####           This Terraform file defines the variables used in Instance Module            ######
#####                                       Instance Module                                  ######
###################################################################################################
###################################################################################################

/**
 * Name: db_vsi_count
 * Type: number
 * Desc: Total Database instances that will be created in the user specified zone.
 *       We have kept the default value to be 2 here. The Database servers count cannot be more than 3.
 **/
variable "db_vsi_count" {
  description = "Total Database instances that will be created in the user specified zone."
  type        = number
  default     = 2
  validation {
    condition     = var.db_vsi_count <= 3
    error_message = "Database VSI count should be less than or equals to 3."
  }
}

/**
* Name: db_image
* Type: String
* Desc: This is the image id used for DB VSI.
**/
variable "db_image" {
  description = "Custom image id for the Database VSI"
  type        = string
  validation {
    condition     = length(var.db_image) == 41
    error_message = "Length of Custom image id for the Database VSI should be 41 characters."
  }
}

/**
* Name: iops_tier
* Desc: Enter the IOPs (IOPS per GB) tier for db data volume. Valid values are 3, 5, and 10.
* Type: number
**/
variable "iops_tier" {
  description = "Enter the IOPs (IOPS per GB) tier for db data volume. Valid values are 3, 5, and 10."
  type        = number
  default     = 5
  validation {
    condition     = contains(["3", "5", "10", 3, 5, 10], var.iops_tier)
    error_message = "Error: Incorrect value for iops_tier. Allowed values are 3, 5 or 10."
  }
}

/**
* Name: data_vol_size
* Desc: Volume Storage size in GB. It will be used for the extra storage volume attached with the DB servers.
* Type: number
**/
variable "data_vol_size" {
  description = "Storage size in GB. The value should be between 10 and 2000"
  type        = number
  default     = 10
  validation {
    condition     = var.data_vol_size >= 10 && var.data_vol_size <= 2000
    error_message = "Error: Incorrect value for size. Allowed size should be between 10 and 2000 GB."
  }
}

/**
* Name: db_profile
* Type: String
* Desc: Hardware configuration profile for the Database VSI.
**/
variable "db_profile" {
  description = "Hardware configuration profile for the Database VSI."
  type        = string
  default     = "cx2-2x4"
}


/**
* Name: tiered_profiles
* Desc: Tiered profiles for Input/Output per seconds in GBs
**/
locals {
  tiered_profiles = {
    "3"  = "general-purpose"
    "5"  = "5iops-tier"
    "10" = "10iops-tier"
  }
}

/**
* Name: db_name
* Type: string
* Desc: Database will be created with the specified name
**/
variable "db_name" {
  description = "Database will be created with the specified name"
  type        = string
  default     = ""
}

/**
* Name: db_user
* Type: string
* Desc: Database user will be created with the specified name
**/
variable "db_user" {
  description = "Database user will be created with the specified name"
  type        = string
  sensitive   = true
  default     = ""
}

/**
* Name: db_pwd
* Type: string
* Desc: Database user will be created with the specified password
**/
variable "db_pwd" {
  description = "Database user will be created with the specified password"
  type        = string
  sensitive   = true
  default     = ""
}
/**
#################################################################################################################
*                               End of the Variable Section 
#################################################################################################################
**/