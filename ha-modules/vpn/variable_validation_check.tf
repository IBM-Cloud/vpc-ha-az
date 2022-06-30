
resource "null_resource" "validation_check_1" {
  provisioner "local-exec" {
    command    = <<EOT
      if [ "${var.enable_vpn}" = true ]; then
        if [ -z "${var.vpn_mode}" ]; then
          echo '\n\n vpn_mode cannot be empty when vpn is enabled'
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
      if [ "${var.enable_vpn}" = true ]; then
        if [ -z "${var.peer_gateway_ip}" ]; then
          echo '\n\n peer_gateway_ip cannot be empty when vpn is enabled'
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
      if [ "${var.enable_vpn}" = true ]; then
        if [ -z "${var.preshared_key}" ]; then
          echo '\n\n preshared_key cannot be empty when vpn is enabled'
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
      if [ "${var.enable_vpn}" = true ]; then
        if [ -z "${var.vpn_action}" ]; then
          echo '\n\n vpn_action cannot be empty when vpn is enabled'
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


