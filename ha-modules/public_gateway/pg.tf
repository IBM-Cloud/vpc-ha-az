/**
#################################################################################################################
*                           Resources Section for the Public Gateway Module.
#################################################################################################################
*/

/**
* Public Gateway for all subnets in particular zone 
* Element : pg
* This resource will be used to create the Public gateway in particular zone
**/
resource "ibm_is_public_gateway" "pg" {
  count          = var.enable_public_gateway ? length(var.zones) : 0
  name           = "${var.prefix}${var.zones[count.index]}-pg"
  vpc            = var.vpc_id
  zone           = var.zones[count.index]
  resource_group = var.resource_group_id
  tags           = var.tags
}