/**
* Locals
* This resource will be used to create and calculate local variables containing Subnet IP count.
* If there is a requirement for extra ips please update the db_ip_count with extra required ips.
**/
locals {
  valid_ip_counts = [8, 16, 32, 64, 128, 256, 512, 1024, 2048, 4096, 8192, 16384]
  web_ip_count    = var.web_max_servers_count + 5 + 2 # 5:reservedIP, 2:load_balancer  
  app_ip_count    = var.app_max_servers_count + 5 + 2 # 5:reservedIP, 2:load_balancer      
  db_ip_count     = var.db_vsi_count + 5              # db_vsi_count:total_db_count, 5:reservedIP

  ip_count = {
    "web" = [for valid_web_ip_count in local.valid_ip_counts : valid_web_ip_count if valid_web_ip_count > local.web_ip_count][0]
    "app" = [for valid_app_ip_count in local.valid_ip_counts : valid_app_ip_count if valid_app_ip_count > local.app_ip_count][0]
    "db"  = [for valid_db_ip_count in local.valid_ip_counts : valid_db_ip_count if valid_db_ip_count > local.db_ip_count][0]
  }
}

/**
* Calling the VPC module with the following required parameters
* source: Path of the Source Code of the VPC Module
* prefix: This is the prefix text that will be pre-pended in every resource name created by this module.
* resource_group_id: The resource group ID
* zone: Please provide the zone name. e.g. us-south-1,us-south-2,us-south-3,us-east-1,etc. 
* ip_count: Total number of IP Address for each subnet
* app_os_type: Provide App servers OS flavour
* web_os_type: Provide Web servers OS flavour
* db_os_type: Provide Db servers OS flavour
* public_gateway_id: Public gateway id to be attached with the subnets
* user_ssh_key: This is the list of existing ssh key/keys of user which will be used to login to Bastion server. Its private key content should be there in path ~/.ssh/id_rsa 
    And public key content should be uploaded to IBM cloud. If you don't have an existing key then create one using ssh-keygen -t rsa -b 4096 -C "user_ID" command.
* bastion_ssh_key: This key will be created dynamically on the bastion VSI. It will be used to login to Web/App/DB servers via Bastion.
* public_ip_address_list: List of User's Public IP addresses in the format X.X.X.X/32 which will be used to login to Bastion VSI
* region: Region name e.g. us-south, us-east, etc.
* bastion_profile: The Profile needed for Bastion VSI creation
* bastion_os_type: OS image to be used [windows | linux] for Bastion server
* local_machine_os_type: Operating System to be used [windows | mac | linux] for your local machine which is running terraform apply
* bastion_image: The Bastion Image needed for Bastion VSI creation
* bastion_ip_count: IP count is the total number of total_ipv4_address_count for Bastion Subnet
* enable_autoscaling: Determines whether to enable autoscaling or not.
* enable_automation: Determines whether to enable automation or not.
* db_private_ip: This variable contains the value of DB private IP which is used for connection
* db_pwd: Database user will be created with the specified password
* db_user: Database user will be created with the specified name
* db_name: Database will be created with the specified name
* web_lb_hostname: Web Load balancer hostname
* wp_blog_title: Title of the website or blog
* wp_admin_user: Name of the Admin User for the wordpress website
* wp_admin_password: Password for the Admin User of the wordpress website
* wp_admin_email: Email of the Admin User of the wordpress website
* app_image: Image id to be used with App VSI
* web_image: Image id to be used with Web VSI
* web_max_servers_count: Maximum Web servers count for the Web Instance group
* app_max_servers_count: Maximum App servers count for the App Instance group
* web_profile: Hardware configuration profile for the Web VSI
* app_profile: Hardware configuration profile for the App VSI
* bandwidth: Bandwidth per second in GB. The possible values are 3, 5 and 10
* data_vol_size: Storage size in GB. The value should be between 10 and 2000
* db_image: Image id to be used with DB VSI
* db_profile: Hardware configuration profile for the DB VSI
* db_vsi_count: Total Database instances that will be created in the user specified zone.
* tiered_profiles: Tiered profiles for Input/Output per seconds in GBs
* alb_port: This is the Application load balancer listener port
* app_lb_type: This variable will hold the App Load Balancer type
* web_lb_type: This variable will hold the Web Load Balancer type
* lb_protocol: LBaaS protocols
* lb_algo: LBaaS backend distribution algorithm
* lb_port_number: declare LBaaS pool member port number
* db_pg_strategy: The strategy for DB servers placement group - host_spread: place on different compute hosts - power_spread: place on compute hosts that use different power sources.
* web_pg_strategy: The strategy for Web servers placement group - host_spread: place on different compute hosts - power_spread: place on compute hosts that use different power sources.
* app_pg_strategy: The strategy for App servers placement group - host_spread: place on different compute hosts - power_spread: place on compute hosts that use different power sources.
**/
module "core_modules" {
  source                 = "./core_modules"
  prefix                 = var.prefix
  resource_group_id      = var.resource_group_id
  zone                   = var.zone
  api_key                = var.api_key
  ip_count               = local.ip_count
  enable_public_gateway  = var.enable_public_gateway
  enable_floating_ip     = var.enable_floating_ip
  enable_vpn             = var.enable_vpn
  public_gateway_id      = var.enable_public_gateway ? module.public_gateway.pg_id[0] : null
  user_ssh_keys          = var.user_ssh_keys
  bastion_ssh_key        = var.bastion_ssh_key_var_name
  public_ip_address_list = local.public_ip_address_list
  region                 = var.regions[var.zone]
  bastion_profile        = var.bastion_profile
  local_machine_os_type  = var.local_machine_os_type
  bastion_image          = var.bastion_image
  bastion_ip_count       = var.bastion_ip_count
  tags                   = var.tags

  //User data Automation Variables
  enable_autoscaling = var.enable_autoscaling
  enable_automation  = var.enable_automation
  db_private_ip      = module.core_modules.db_target[0]
  db_pwd             = var.db_pwd
  db_user            = var.db_user
  db_name            = var.db_name
  web_lb_hostname    = module.core_modules.lb_dns.WEB_SERVER
  wp_blog_title      = var.wp_blog_title
  wp_admin_user      = var.wp_admin_user
  wp_admin_password  = var.wp_admin_password
  wp_admin_email     = var.wp_admin_email

  //App Web VSI Variables
  app_image             = var.app_image
  web_image             = var.web_image
  web_max_servers_count = var.web_max_servers_count
  app_max_servers_count = var.app_max_servers_count
  app_profile           = var.app_config["instance_profile"]
  web_profile           = var.web_config["instance_profile"]

  //Database VSI Variables
  iops_tier       = var.iops_tier
  data_vol_size   = var.data_vol_size
  db_image        = var.db_image
  db_profile      = var.db_profile
  db_vsi_count    = var.db_vsi_count
  tiered_profiles = local.tiered_profiles

  //Load Balancer Variables
  alb_port          = local.alb_port
  wlb_port          = local.wlb_port
  lb_protocol_value = local.lb_protocol_value
  lb_algo_value     = local.lb_algo_value
  app_lb_type       = local.app_lb_type
  web_lb_type       = var.web_lb_type
  lb_protocol       = local.lb_protocol
  lb_algo           = local.lb_algo
  lb_port_number    = var.lb_port_number

  //Placement Group Variables
  db_pg_strategy  = var.db_pg_strategy
  web_pg_strategy = var.web_pg_strategy
  app_pg_strategy = var.app_pg_strategy
  cos_validation  = module.cos.cos_validation
}

/**
* Calling the Public Gateway module with the following required parameters
* source: Path of the Source Code of the Public Gateway Module
* vpc_id: VPC ID of region2 for the the Public Gateway Module. Public Gateways will be created inside this VPC.
* prefix: This is the prefix text that will be pre-pended in every resource name created by this module.
* resource_group_id: The resource group ID
* zone: Please provide the zone name. e.g. us-south-1, us-south-2, us-south-3, us-east-1, etc.
* depends_on: This ensures that the vpc object will be created before the Public Gateway Module
**/
module "public_gateway" {
  source                = "../ha-modules/public_gateway"
  enable_public_gateway = var.enable_public_gateway
  vpc_id                = module.core_modules.vpc.id
  prefix                = "${var.prefix}region-"
  resource_group_id     = var.resource_group_id
  zones                 = [var.zone]
  api_key               = var.api_key
  tags                  = var.tags
}

/**
* Calling the Instance Group module with the following required parameters
* source: Source Directory of the Module
* enable_autoscaling: Determines whether to enable autoscaling or not.
* enable_automation: Determines whether to enable automation or not.
* vpc_id: VPC ID to contain the subnets
* prefix: This will be appended in resources created by this module
* resource_group_id: The resource group id
* zone: Please provide the zone name. e.g. us-south-1,us-south-2,us-south-3,us-east-1,etc.
* ssh_key: This ssh_key got generated dynamically on the bastion server and further will be attached with all the other VSI to be connected from Bastion Server only
* subnets: We are passing the Map of subnet objects. It includes all the subnet IDs
* sg_objects: We are passing the Map of security group objects. It includes all the security groups IDs
* objects: This variable will contain the objects of LB, LB Pool and LB Listeners. It includes IDs of load balancer, load balancer pools and load balancer listeners.
* app_image: Image id to be used with App VSI
* app_config: Application configuration Map
* web_image: Image id to be used with Web VSI
* web_config: Web configuration Map
* web_max_servers_count: Maximum Web servers count for the Web Instance group
* web_min_servers_count: Minimum Web servers count for the Web Instance group
* web_cpu_threshold: Average target CPU Percent for CPU policy of Web Instance Group.
* web_aggregation_window: The aggregation window is the time period in seconds that the instance group manager monitors each instance and determines the average utilization.
* web_cooldown_time: Specify the cool down period, the number of seconds to pause further scaling actions after scaling has taken place.
* app_max_servers_count: Maximum App servers count for the App Instance group
* app_min_servers_count: Minimum App servers count for the App Instance group
* app_cpu_threshold: Average target CPU Percent for CPU policy of App Instance Group.
* app_aggregation_window: The aggregation window is the time period in seconds that the instance group manager monitors each instance and determines the average utilization.
* app_cooldown_time: Specify the cool down period, the number of seconds to pause further scaling actions after scaling has taken place.
* depends_on: This ensures that the vpc and other objects will be created before the instance group
**/
module "autoscale" {
  source                 = "../ha-modules/autoscale"
  enable_autoscaling     = var.enable_autoscaling
  enable_automation      = var.enable_automation
  api_key                = var.api_key
  vpc_id                 = module.core_modules.vpc.id
  prefix                 = var.prefix
  resource_group_id      = var.resource_group_id
  zone                   = var.zone
  tags                   = var.tags
  ssh_key                = [module.core_modules.bastion_key_id]
  subnets                = module.core_modules.sub_objects
  sg_objects             = module.core_modules.sg_objects
  objects                = module.core_modules.objects
  web_placement_group_id = module.core_modules.web_pg_id
  app_placement_group_id = module.core_modules.app_pg_id
  app_image              = var.app_image
  app_config             = var.app_config
  web_image              = var.web_image
  web_config             = var.web_config
  web_max_servers_count  = var.web_max_servers_count
  web_min_servers_count  = var.web_min_servers_count
  web_cpu_threshold      = var.web_cpu_threshold
  web_aggregation_window = var.web_aggregation_window
  web_cooldown_time      = var.web_cooldown_time
  app_max_servers_count  = var.app_max_servers_count
  app_min_servers_count  = var.app_min_servers_count
  app_cpu_threshold      = var.app_cpu_threshold
  app_aggregation_window = var.app_aggregation_window
  app_cooldown_time      = var.app_cooldown_time
  db_private_ip          = module.core_modules.db_target[0]
  db_pwd                 = var.db_pwd
  db_user                = var.db_user
  db_name                = var.db_name
  web_lb_hostname        = module.core_modules.lb_dns.WEB_SERVER
  wp_blog_title          = var.wp_blog_title
  wp_admin_user          = var.wp_admin_user
  wp_admin_password      = var.wp_admin_password
  wp_admin_email         = var.wp_admin_email

}

/**
* Cross Region service provides higher durability and availability than using a single region, at the cost of slightly higher latency. 
* This service is available today in the U.S., E.U., and A.P. areas.
* Calling the COS Bucket module with the following required parameters
* source: Path of the Source Code of the COS Bucket Module
* prefix: This is the prefix text that will be pre-pended in every resource name created by this module.
* resource_group_id: The resource group ID
* cos_bucket_plan: List of available plan for the COS bucket. e.g. "lite" and "standard"
* cross_region_location: Cross Region service provides higher durability and availability than using a single region, 
*       at the cost of slightly higher latency. 
*       This service is available today in the U.S., E.U., and A.P. areas.
* storage_class: Storage class helps in choosing a right storage plan and location and helps in reducing the cost.
* bucket_location: The location of the COS bucket
* obj_key: The name of an object in the COS bucket. This is used to identify our object.
* obj_content: Literal string value to use as an object content, which will be uploaded as UTF-8 encoded text. Conflicts with content_base64 and content_file. 
**/
module "cos" {
  source                = "../ha-modules/cos"
  enable_cos            = var.enable_cos
  tags                  = var.tags
  vpc                   = module.core_modules.vpc
  api_key               = var.api_key
  zone                  = var.zone
  prefix                = "${var.prefix}region-"
  resource_group_id     = var.resource_group_id
  cos_bucket_plan       = var.cos_bucket_plan
  cross_region_location = var.cross_region_location
  storage_class         = var.storage_class
  bucket_location       = var.bucket_location
  obj_key               = var.obj_key
  obj_content           = var.obj_content
}

/**
* Calling the VPN module with the following required parameters
* source: Path of the Source Code of the VPN Module
* resource_group_id: The resource group ID
* vpc_id: VPC ID for the the VPN Module. Routing table will be created inside this VPC.
* prefix: This is the prefix text that will be pre-pended in every resource name created by this module.
* zone: List of zone for the provided region. If region is us-east then zone would be ["us-east-1","us-east-2","us-east-3"]
* vpn_mode: Mode in VPN gateway. Supported values are route or policy.
* subnet: Subnet ID for the the VPN Module. VPN gateway will be created inside this Subnet.
* preshared_key: he Key configured on the peer gateway. The key is usually a complex string similar to a password.
* local_cidrs: List of local CIDRs for the creation of VPN connection.
* peer_cidrs: List of peer CIDRs for the creation of VPN connection.
* peer_gateway_ip: The IP address of the peer VPN gateway.
* action: Dead peer detection actions, action to take when a peer gateway stops responding. Supported values are restart, clear, hold, or none. Default value is none.
* admin_state_up: The VPN gateway connection status. If set to false, the VPN gateway connection is shut down
* interval: Dead peer detection interval in seconds. How often to test that the peer gateway is responsive.
* timeout: Dead peer detection timeout in seconds. Defines the timeout interval after which all connections to a peer are deleted due to inactivity. This timeout applies only to IKEv1.
* authentication_algorithm: Enter the algorithm that you want to use to authenticate IPSec peers. Available options are md5, sha1, sha256, or sha512
* encryption_algorithm: Enter the algorithm that you want to use to encrypt data. Available options are: triple_des, aes128, or aes256
* key_lifetime: The key lifetime in seconds. Maximum: 86400, Minimum: 1800. Length of time that a secret key is valid for the tunnel in the phase before it must be renegotiated.
* dh_group: Enter the Diffie-Hellman group that you want to use for the encryption key. Available enumeration type are 2, 5, 14, or 19
* ike_version: Enter the IKE protocol version that you want to use. Available options are 1, or 2
* perfect_forward_secrecy: Enter the Perfect Forward Secrecy protocol that you want to use during a session. Available options are disabled, group_2, group_5, and group_14
* tags: A list of tags that you want to add to your VPN gateway. Tags can help you find your VPN gateway more easily later.
**/
module "vpn" {
  source                   = "../ha-modules/vpn"
  prefix                   = var.prefix
  enable_vpn               = var.enable_vpn
  resource_group_id        = var.resource_group_id
  vpc_id                   = module.core_modules.vpc.id
  zone                     = var.zone
  region                   = var.regions[var.zone]
  vpn_mode                 = var.vpn_mode
  subnet                   = module.core_modules.bastion_sub_id
  preshared_key            = var.preshared_key
  local_cidrs              = [module.core_modules.bastion_sub_cidr]
  peer_cidrs               = var.peer_cidrs
  peer_gateway_ip          = var.peer_gateway_ip
  action                   = var.action
  admin_state_up           = var.admin_state_up
  interval                 = var.interval
  timeout                  = var.timeout
  authentication_algorithm = var.authentication_algorithm
  encryption_algorithm     = var.encryption_algorithm
  key_lifetime             = var.key_lifetime
  dh_group                 = var.dh_group
  ike_version              = var.ike_version
  perfect_forward_secrecy  = var.perfect_forward_secrecy
  tags                     = [var.prefix]
  api_key                  = var.api_key
}
