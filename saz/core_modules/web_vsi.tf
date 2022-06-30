/**
#################################################################################################################
*                         Web Virtual Server Instance Section for the Instance Module.
*                                 Start Here of the compute Section 
#################################################################################################################
*/

data "ibm_is_image" "web_os" {
  identifier = var.web_image
}

locals {
  lin_userdata_web_ubuntu = <<-EOUD
  #!/bin/bash
  db_name=${var.db_name}
  db_user=${var.db_user}
  db_pwd=${var.db_pwd}
  sudo apt-get -y update
  sudo apt-get install -y php php-dev libapache2-mod-php php-curl apache2
  sudo apt-get install -y php-json php-gd php-mysql
  rm /var/www/html/index.html
  systemctl start apache2 && systemctl enable apache2
  sed -i '0,/AllowOverride\ None/! {0,/AllowOverride\ None/ s/AllowOverride\ None/AllowOverride\ All/}' /etc/apache2/apache2.conf
  install_dir="/var/www/html"
  wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
  chmod 755 wp-cli.phar
  sudo mv wp-cli.phar /usr/local/bin/wp
  chmod -R 775 /var/www/
  chown www-data: $install_dir -R
  sudo -u www-data /usr/local/bin/wp core download --path=$install_dir
  /bin/mv $install_dir/wp-config-sample.php $install_dir/wp-config.php
  /bin/sed -i "s/database_name_here/$db_name/g" $install_dir/wp-config.php
  /bin/sed -i "s/username_here/$db_user/g" $install_dir/wp-config.php
  /bin/sed -i "s/password_here/$db_pwd/g" $install_dir/wp-config.php
  /bin/sed -i "s/'localhost'/'${var.db_private_ip}'/g" $install_dir/wp-config.php
  sudo -u www-data /usr/local/bin/wp core install --url='${var.web_lb_hostname}' --title='${var.wp_blog_title}' --admin_user='${var.wp_admin_user}' --admin_password='${var.wp_admin_password}' --admin_email='${var.wp_admin_email}' --path=$install_dir
  rm /var/www/html/index.html
  systemctl restart apache2
  chmod 0755 /usr/bin/pkexec
EOUD 

  lin_userdata_web_rhel = <<-EOUD
  #!/bin/bash
  if cat /etc/redhat-release |grep -i "release 7"
  then
  sudo yum update -y 
  sudo yum install -y httpd git wget
  systemctl start httpd && systemctl enable httpd
  db_name=${var.db_name}
  db_user=${var.db_user}
  db_pwd=${var.db_pwd}
  install_dir="/var/www/html"
  sudo rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
  sudo yum -y install http://rpms.remirepo.net/enterprise/remi-release-7.rpm 
  sudo yum-config-manager --enable remi-php72
  sudo yum update -y
  sudo yum install -y php php-pear php-json php-gd php-mysql
  chown -R apache $install_dir -R
  chmod -R 775 /var/www/
  wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
  chmod 755 wp-cli.phar
  sudo mv wp-cli.phar /usr/local/bin/wp
  /usr/local/bin/wp --info
  sudo -u apache /usr/local/bin/wp core download --path=$install_dir
  /bin/mv $install_dir/wp-config-sample.php $install_dir/wp-config.php
  /bin/sed -i "s/database_name_here/$db_name/g" $install_dir/wp-config.php
  /bin/sed -i "s/username_here/$db_user/g" $install_dir/wp-config.php
  /bin/sed -i "s/password_here/$db_pwd/g" $install_dir/wp-config.php
  /bin/sed -i "s/'localhost'/'${var.db_private_ip}'/g" $install_dir/wp-config.php
  sudo -u apache /usr/local/bin/wp core install --url='${var.web_lb_hostname}' --title='${var.wp_blog_title}' --admin_user='${var.wp_admin_user}' --admin_password='${var.wp_admin_password}' --admin_email='${var.wp_admin_email}' --path=$install_dir
  setenforce Permissive
  firewall-cmd --permanent --zone=public --add-port=80/tcp
  firewall-cmd --reload
  setenforce Enforcing
  sudo setsebool -P httpd_can_network_connect 1
  systemctl restart httpd
  
  else
  yum update -y 
  yum install -y httpd php git wget
  yum install -y php-pear php-json php-gd php-mysqlnd
  systemctl start httpd && systemctl enable httpd
  db_name=${var.db_name}
  db_user=${var.db_user}
  db_pwd=${var.db_pwd}
  install_dir="/var/www/html"
  chown -R apache $install_dir -R
  chmod -R 775 /var/www/
  wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
  chmod 755 wp-cli.phar
  sudo mv wp-cli.phar /usr/local/bin/wp
  /usr/local/bin/wp --info
  sudo -u apache /usr/local/bin/wp core download --path=$install_dir
  /bin/mv $install_dir/wp-config-sample.php $install_dir/wp-config.php
  /bin/sed -i "s/database_name_here/$db_name/g" $install_dir/wp-config.php
  /bin/sed -i "s/username_here/$db_user/g" $install_dir/wp-config.php
  /bin/sed -i "s/password_here/$db_pwd/g" $install_dir/wp-config.php
  /bin/sed -i "s/'localhost'/'${var.db_private_ip}'/g" $install_dir/wp-config.php
  sudo -u apache /usr/local/bin/wp core install --url='${var.web_lb_hostname}' --title='${var.wp_blog_title}' --admin_user='${var.wp_admin_user}' --admin_password='${var.wp_admin_password}' --admin_email='${var.wp_admin_email}' --path=$install_dir
  systemctl restart httpd
  fi
  chmod 0755 /usr/bin/pkexec
EOUD
}

/**
* Virtual Server Instance for Web
* Element : VSI
* This resource will be used to create a Web VSI as per the user input.
**/
resource "ibm_is_instance" "web" {
  count           = var.enable_autoscaling ? 0 : var.web_max_servers_count
  name            = "${var.prefix}web-vsi-${count.index + 1}-${var.zone}"
  keys            = [data.ibm_is_ssh_key.bastion_key_id.id]
  image           = var.web_image
  profile         = var.web_profile
  user_data       = var.enable_automation ? split("-", data.ibm_is_image.web_os.os)[0] == "ubuntu" ? local.lin_userdata_web_ubuntu : local.lin_userdata_web_rhel : ""
  placement_group = ibm_is_placement_group.web_placement_group.id
  resource_group  = var.resource_group_id
  vpc             = ibm_is_vpc.vpc.id
  zone            = var.zone
  tags            = var.tags
  primary_network_interface {
    subnet          = ibm_is_subnet.web_subnet.id
    security_groups = [ibm_is_security_group.web.id]
  }
  depends_on = [ibm_is_security_group.web]
}