/**
#################################################################################################################
*                           Resources Section for the VPC Module.
#################################################################################################################
*/

/**
* VPC: Virtual Private Cloud
* Element : vpc
* This resource will be used to create a vpc.
**/
resource "ibm_is_vpc" "vpc" {
  name           = "${var.prefix}vpc"
  resource_group = var.resource_group_id
  tags           = var.tags
  depends_on = [
    null_resource.placement_group_validation_check_linux, null_resource.placement_group_validation_check_windows, null_resource.validation_check_1, null_resource.validation_check_2, null_resource.validation_check_3, null_resource.validation_check_4, null_resource.validation_check_5, null_resource.validation_check_6, null_resource.validation_check_7, null_resource.validation_check_8, var.cos_validation
  ]
}