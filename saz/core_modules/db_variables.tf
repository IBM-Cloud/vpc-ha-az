/**
#################################################################################################################
*                           Variable Section for the DB Instance Module.
*                                 Start Here of the Variable Section 
#################################################################################################################
*/

/**
 * Name: db_vsi_count
 * Type: number
 * Desc: Total Database instances that will be created in the user specified zone.
 **/
variable "db_vsi_count" {
  description = "Total Database instances that will be created in the user specified zone."
  type        = number
}

/**
* Name: db_image
* Desc: This variable will hold the image name for db instance
* Type: String
**/
variable "db_image" {
  description = "Image for DB VSI"
  type        = string
}

/**
* Name: db_profile
* Desc: This variable will hold the image profile name for db instance
* Type: String
**/
variable "db_profile" {
  description = "DB Profile"
  type        = string
}

/**
* Name: iops_tier
* Desc: Input/Output per seconds in GB
* Type: number
**/
variable "iops_tier" {
  description = "Enter the IOPs (IOPS per GB) tier for db data volume. Valid values are 3, 5, and 10."
  type        = number
  validation {
    condition     = contains(["3", "5", "10", 3, 5, 10], var.iops_tier)
    error_message = "Error: Incorrect value for iops_tier. Allowed values are 3, 5 and 10."
  }
}

/**
* Name: tiered_profiles
* Desc: Tiered profiles for Input/Output per seconds in GBs
* Type: map(any)
**/
variable "tiered_profiles" {
  description = "Tiered profiles for Input/Output per seconds in GBs"
  type        = map(any)
}

/**
* Name: data_vol_size
* Desc: Storage size in GB
* Type: number
**/
variable "data_vol_size" {
  description = "Storage size in GB. The value should be between 10 and 2000"
  type        = number
  validation {
    condition     = var.data_vol_size >= 10 && var.data_vol_size <= 2000
    error_message = "Error: Incorrect value for size. Allowed size should be between 10 and 2000 GB."
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
}

/**
* Name: db_user
* Type: string
* Desc: Database user will be created with the specified name
**/
variable "db_user" {
  description = "Database user will be created with the specified name"
  type        = string
}

/**
* Name: db_pwd
* Type: string
* Desc: Database user will be created with the specified password
**/
variable "db_pwd" {
  description = "Database user will be created with the specified password"
  type        = string
}

/**
* Name: DB private IP
* Type: string
* Desc: This variable contains the value of DB private IP which is used for connection.
**/
variable "db_private_ip" {
  description = "This variable contains the value of DB private IP which is used for connection."
  type        = string
}

/**
#################################################################################################################
*                               End of the Variable Section 
#################################################################################################################
**/
