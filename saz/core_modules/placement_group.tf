/**
#################################################################################################################
*                           Resources Section for the Placement Group Module.
#################################################################################################################
*/

/**
* Placement group validation for Linux/Mac Host Machine check null resource
* Element: null_resource
* This resource is used to validate the instance groups max server count and Database VSI count as per the placement group strategy provided.
**/
resource "null_resource" "placement_group_validation_check_linux" {
  count = lower(var.local_machine_os_type) == "windows" ? 0 : 1
  provisioner "local-exec" {
    command    = <<EOT
      chmod 755 ${path.cwd}/core_modules/placement_group_validation_check_linux.sh
      ./core_modules/placement_group_validation_check_linux.sh ${var.web_pg_strategy} ${var.web_max_servers_count} ${var.app_pg_strategy} ${var.app_max_servers_count} ${var.db_pg_strategy} ${var.db_vsi_count}
    EOT
    on_failure = fail
  }
}

/**
* Placement group validation for Windows Host Machine check null resource
* Element: null_resource
* This resource is used to validate the instance groups max server count and Database VSI count as per the placement group strategy provided.
**/
resource "null_resource" "placement_group_validation_check_windows" {
  count = lower(var.local_machine_os_type) == "windows" ? 1 : 0
  provisioner "local-exec" {
    interpreter = ["PowerShell", "-Command"]
    command     = <<EOT
      & ${path.cwd}/core_modules/placement_group_validation_check_windows.ps1 ${var.web_pg_strategy} ${var.web_max_servers_count} ${var.app_pg_strategy} ${var.app_max_servers_count} ${var.db_pg_strategy} ${var.db_vsi_count}
    EOT
    on_failure  = fail
  }
}

/**
* Placement Group resource block
* Element : Placement Group for Database servers
* This resource will be used to create a DB placement group.
**/
resource "ibm_is_placement_group" "db_placement_group" {
  strategy       = var.db_pg_strategy
  name           = "${var.prefix}db-pg"
  resource_group = var.resource_group_id
  tags           = var.tags
  depends_on = [
    ibm_is_vpc.vpc
  ]
}

/**
* Placement Group resource block
* Element : Placement Group for Web servers
* This resource will be used to create a Web placement group.
**/
resource "ibm_is_placement_group" "web_placement_group" {
  strategy       = var.web_pg_strategy
  name           = "${var.prefix}web-pg"
  resource_group = var.resource_group_id
  tags           = var.tags
  depends_on = [
    ibm_is_vpc.vpc
  ]
}

/**
* Placement Group resource block
* Element : Placement Group for App servers
* This resource will be used to create a App placement group.
**/
resource "ibm_is_placement_group" "app_placement_group" {
  strategy       = var.app_pg_strategy
  name           = "${var.prefix}app-pg"
  resource_group = var.resource_group_id
  tags           = var.tags
  depends_on = [
    ibm_is_vpc.vpc
  ]
}