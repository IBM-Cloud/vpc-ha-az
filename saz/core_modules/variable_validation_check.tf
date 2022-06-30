
resource "null_resource" "validation_check_1" {
  provisioner "local-exec" {
    command    = <<EOT
      if [ "${var.enable_automation}" = true ]; then
        if [ "${var.enable_public_gateway}" = false ]; then
          echo '\n\n Public gateway needs to be created when automation is enabled'
          exit 1
        fi       
      fi  
    EOT
    on_failure = fail
  }
}

resource "null_resource" "validation_check_2" {
  provisioner "local-exec" {
    command    = <<EOT
      if [ "${var.enable_automation}" = true ]; then
        if [ -z "${var.db_user}" ]; then
          echo '\n\n db_user cannot be empty when automation is enabled'
          exit 1
        fi     
      fi  
    EOT
    on_failure = fail
  }
  depends_on = [
    null_resource.validation_check_1
  ]
}

resource "null_resource" "validation_check_3" {
  provisioner "local-exec" {
    command    = <<EOT
      if [ "${var.enable_automation}" = true ]; then
        if [ -z "${var.db_name}" ]; then
          echo '\n\n db_name cannot be empty when automation is enabled'
          exit 1
        fi       
      fi  
    EOT
    on_failure = fail
  }
  depends_on = [
    null_resource.validation_check_2
  ]
}

resource "null_resource" "validation_check_4" {
  provisioner "local-exec" {
    command    = <<EOT
      if [ "${var.enable_automation}" = true ]; then
        if [ -z "${var.db_pwd}" ]; then
          echo '\n\n db_pwd cannot be empty when automation is enabled'
          exit 1
        fi     
      fi  
    EOT
    on_failure = fail
  }
  depends_on = [
    null_resource.validation_check_3
  ]
}

resource "null_resource" "validation_check_5" {
  provisioner "local-exec" {
    command    = <<EOT
      if [ "${var.enable_automation}" = true ]; then
        if [ -z "${var.wp_admin_user}" ]; then
          echo '\n\n wp_admin_user cannot be empty when automation is enabled'
          exit 1
        fi     
      fi  
    EOT
    on_failure = fail
  }
  depends_on = [
    null_resource.validation_check_4
  ]
}

resource "null_resource" "validation_check_6" {
  provisioner "local-exec" {
    command    = <<EOT
      if [ "${var.enable_automation}" = true ]; then
        if [ -z "${var.wp_admin_password}" ]; then
          echo '\n\n wp_admin_password cannot be empty when automation is enabled'
          exit 1
        fi      
      fi  
    EOT
    on_failure = fail
  }
  depends_on = [
    null_resource.validation_check_5
  ]
}

resource "null_resource" "validation_check_7" {
  provisioner "local-exec" {
    command    = <<EOT
      if [ "${var.enable_automation}" = true ]; then
        if [ -z "${var.wp_admin_email}" ]; then
          echo '\n\n wp_admin_email cannot be empty when automation is enabled'
          exit 1
        fi      
      fi  
    EOT
    on_failure = fail
  }
  depends_on = [
    null_resource.validation_check_6
  ]
}

resource "null_resource" "validation_check_8" {
  provisioner "local-exec" {
    command    = <<EOT
      if [ "${var.enable_automation}" = true ]; then
        if [ -z "${var.wp_blog_title}" ]; then
          echo '\n\n wp_blog_title cannot be empty when automation is enabled'
          exit 1
        fi        
      fi  
    EOT
    on_failure = fail
  }
  depends_on = [
    null_resource.validation_check_7
  ]
}