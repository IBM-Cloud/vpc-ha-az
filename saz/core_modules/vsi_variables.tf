/**
#################################################################################################################
*                                Variable Section for the VSI Section.
*                                 Start Here for the Variable Section 
#################################################################################################################
*/

/**
* Name: web_max_servers_count
* Type: number
* Desc: Maximum Web servers count for the Web Instance group
**/
variable "web_max_servers_count" {
  description = "Maximum Web servers count for the Web Instance group"
  type        = number
}

/**
* Name: app_max_servers_count
* Type: number
* Desc: Maximum App servers count for the App Instance group
**/
variable "app_max_servers_count" {
  description = "Maximum App servers count for the App Instance group"
  type        = number
}

/**
* Name: web_image
* Desc: This variable will hold the image name for web instance
* Type: String
**/
variable "web_image" {
  description = " This variable will hold the image name for web instance"
  type        = string
}

/**
* Name: app_image
* Desc: This variable will hold the image name for app instance
* Type: String
**/
variable "app_image" {
  description = "This variable will hold the image name for app instance"
  type        = string
}

/**
* Name: web_profile
* Desc: This variable will hold the image profile name for web instance
* Type: String
**/
variable "web_profile" {
  description = "This variable will hold the image profile name for web instance"
  type        = string
}

/**
* Name: app_profile
* Desc: This variable will hold the image profile name for app instance
* Type: String
**/
variable "app_profile" {
  description = "This variable will hold the image profile name for app instance"
  type        = string
}

/**
* Name: web_lb_hostname
* Type: string
* Desc: Web Load balancer hostname
**/
variable "web_lb_hostname" {
  description = "Web Load balancer hostname"
  type        = string
}

/**
* Name: wp_blog_title
* Type: string
* Desc: Title of the website or blog
**/
variable "wp_blog_title" {
  description = "Title of the website or blog"
  type        = string
}

/**
* Name: admin_user
* Type: string
* Desc: Name of the Admin User for the wordpress website
**/
variable "wp_admin_user" {
  description = "Name of the Admin User of the wordpress website"
  type        = string
}

/**
* Name: admin_password
* Type: string
* Desc: Password for the Admin User of the wordpress website
**/
variable "wp_admin_password" {
  description = "Password of the Admin User for the wordpress website"
  type        = string
}

/**
* Name: admin_email
* Type: string
* Desc: Email of the Admin User of the wordpress website
**/
variable "wp_admin_email" {
  description = "Email of the Admin User for the wordpress website"
  type        = string
}
