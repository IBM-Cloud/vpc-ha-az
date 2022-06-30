/**
#################################################################################################################
*                           Variable Section for the Placement Group Section.
*                                 Start Here for the Variable Section 
#################################################################################################################
*/

/**
* Name: db_pg_strategy
* Type: string
* Desc: The strategy for Database servers placement group - host_spread: place on different compute hosts - power_spread: place on compute hosts that use different power sources.
**/
variable "db_pg_strategy" {
  description = "The strategy for Database servers placement group - host_spread: place on different compute hosts - power_spread: place on compute hosts that use different power sources."
  type        = string
}

/**
* Name: web_pg_strategy
* Type: string
* Desc: The strategy for Web servers placement group - host_spread: place on different compute hosts - power_spread: place on compute hosts that use different power sources.
**/
variable "web_pg_strategy" {
  description = "The strategy for Web servers placement group - host_spread: place on different compute hosts - power_spread: place on compute hosts that use different power sources."
  type        = string
}

/**
* Name: app_pg_strategy
* Type: string
* Desc: The strategy for App servers placement group - host_spread: place on different compute hosts - power_spread: place on compute hosts that use different power sources.
**/
variable "app_pg_strategy" {
  description = "The strategy for App servers placement group - host_spread: place on different compute hosts - power_spread: place on compute hosts that use different power sources."
  type        = string
}
