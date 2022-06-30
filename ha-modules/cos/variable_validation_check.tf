
resource "null_resource" "validation_check_1" {
  provisioner "local-exec" {
    command    = <<EOT
      if [ "${var.enable_cos}" = true ]; then
        if [ -z "${var.cos_bucket_plan}" ]; then
          echo '\n\n cos_bucket_plan cannot be empty when COS is enabled'
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
      if [ "${var.enable_cos}" = true ]; then
        if [ -z "${var.cross_region_location}" ]; then
          echo '\n\n cross_region_location cannot be empty when COS is enabled'
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
      if [ "${var.enable_cos}" = true ]; then
        if [ -z "${var.storage_class}" ]; then
          echo '\n\n storage_class cannot be empty when COS is enabled'
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
      if [ "${var.enable_cos}" = true ]; then
        if [ -z "${var.bucket_location}" ]; then
          echo '\n\n bucket_location cannot be empty when COS is enabled'
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
      if [ "${var.enable_cos}" = true ]; then
        if [ -z "${var.obj_key}" ]; then
          echo '\n\n obj_key cannot be empty when COS is enabled'
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
      if [ "${var.enable_cos}" = true ]; then
        if [ -z "${var.obj_content}" ]; then
          echo '\n\n obj_content cannot be empty when COS is enabled'
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

