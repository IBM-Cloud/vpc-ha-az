/**
#################################################################################################################
*                         App Virtual Server Instance Section for the Instance Module.
*                                 Start Here of the compute Section 
#################################################################################################################
*/

data "ibm_is_image" "app_os" {
  identifier = var.app_image
}

locals {
  lin_userdata_app_ubuntu = <<-EOUD
  #!/bin/bash
  sudo apt-get -y update
  sudo apt-get install -y php php-dev libapache2-mod-php php-curl apache2
  sudo apt-get install -y php-json php-gd php-mysql
  systemctl start apache2 && systemctl enable apache2
  chmod 0755 /usr/bin/pkexec
EOUD

  lin_userdata_app_rhel = <<-EOUD
  #!/bin/bash
  if cat /etc/redhat-release |grep -i "release 7"
  then
  fi
  yum update -y
  yum install -y httpd php git
  yum install -y php-devel
  yum install -y php-pear php-json php-gd
  yum install -y wget
  systemctl start httpd && systemctl enable httpd
  echo "Welcome to the IBM" > /var/www/html/index.html
  chmod 755 /var/www/html/index.html
  if cat /etc/redhat-release |grep -i "release 7"
  then
  setenforce Permissive
  firewall-cmd --permanent --zone=public --add-port=80/tcp
  firewall-cmd --reload
  setenforce Enforcing
  sudo setsebool -P httpd_can_network_connect 1
  fi      
  systemctl restart httpd
  chmod 0755 /usr/bin/pkexec
EOUD
}

/**
* Virtual Server Instance for App
* Element : VSI
* This resource will be used to create a App VSI as per the user input.
**/
resource "ibm_is_instance" "app" {
  count           = var.enable_autoscaling ? 0 : var.app_max_servers_count
  name            = "${var.prefix}app-vsi-${count.index + 1}-${var.zone}"
  keys            = [data.ibm_is_ssh_key.bastion_key_id.id]
  image           = var.app_image
  profile         = var.app_profile
  resource_group  = var.resource_group_id
  placement_group = ibm_is_placement_group.app_placement_group.id
  user_data       = var.enable_automation ? split("-", data.ibm_is_image.app_os.os)[0] == "ubuntu" ? local.lin_userdata_app_ubuntu : local.lin_userdata_app_rhel : ""
  vpc             = ibm_is_vpc.vpc.id
  zone            = var.zone
  tags            = var.tags
  primary_network_interface {
    subnet          = ibm_is_subnet.app_subnet.id
    security_groups = [ibm_is_security_group.app.id]
  }
  depends_on = [ibm_is_security_group.app]
}

/**
* Time Sleep
* Element : wait_600_seconds_app
* This resource will create a waiting period so the respective servers are up and running.
**/
resource "time_sleep" "wait_600_seconds_app" {
  count           = var.enable_automation ? (var.enable_autoscaling ? 0 : 1) : 0
  create_duration = "600s"
  depends_on      = [ibm_is_instance.app, ibm_is_instance.web]
}