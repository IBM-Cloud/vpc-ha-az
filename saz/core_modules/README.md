## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_ibm"></a> [ibm](#provider\_ibm) | n/a |
| <a name="provider_null"></a> [null](#provider\_null) | n/a |
| <a name="provider_time"></a> [time](#provider\_time) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [ibm_is_floating_ip.bastion_floating_ip](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/is_floating_ip) | resource |
| [ibm_is_instance.app](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/is_instance) | resource |
| [ibm_is_instance.bastion](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/is_instance) | resource |
| [ibm_is_instance.db](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/is_instance) | resource |
| [ibm_is_instance.web](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/is_instance) | resource |
| [ibm_is_lb.app_lb](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/is_lb) | resource |
| [ibm_is_lb.web_lb](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/is_lb) | resource |
| [ibm_is_lb_listener.app_listener](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/is_lb_listener) | resource |
| [ibm_is_lb_listener.web_listener](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/is_lb_listener) | resource |
| [ibm_is_lb_pool.app_pool](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/is_lb_pool) | resource |
| [ibm_is_lb_pool.web_pool](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/is_lb_pool) | resource |
| [ibm_is_lb_pool_member.app_lb_member](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/is_lb_pool_member) | resource |
| [ibm_is_lb_pool_member.web_lb_member](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/is_lb_pool_member) | resource |
| [ibm_is_placement_group.app_placement_group](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/is_placement_group) | resource |
| [ibm_is_placement_group.db_placement_group](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/is_placement_group) | resource |
| [ibm_is_placement_group.web_placement_group](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/is_placement_group) | resource |
| [ibm_is_security_group.app](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/is_security_group) | resource |
| [ibm_is_security_group.bastion](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/is_security_group) | resource |
| [ibm_is_security_group.db](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/is_security_group) | resource |
| [ibm_is_security_group.lb_sg](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/is_security_group) | resource |
| [ibm_is_security_group.web](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/is_security_group) | resource |
| [ibm_is_security_group_rule.app_outbound](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/is_security_group_rule) | resource |
| [ibm_is_security_group_rule.app_rule_22](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/is_security_group_rule) | resource |
| [ibm_is_security_group_rule.app_rule_80](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/is_security_group_rule) | resource |
| [ibm_is_security_group_rule.app_rule_lb_listener](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/is_security_group_rule) | resource |
| [ibm_is_security_group_rule.bastion_outbound](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/is_security_group_rule) | resource |
| [ibm_is_security_group_rule.bastion_rule_22](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/is_security_group_rule) | resource |
| [ibm_is_security_group_rule.db_outbound](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/is_security_group_rule) | resource |
| [ibm_is_security_group_rule.db_rule_22](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/is_security_group_rule) | resource |
| [ibm_is_security_group_rule.db_rule_80](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/is_security_group_rule) | resource |
| [ibm_is_security_group_rule.db_rule_app_3306](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/is_security_group_rule) | resource |
| [ibm_is_security_group_rule.db_rule_web_3306](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/is_security_group_rule) | resource |
| [ibm_is_security_group_rule.lb_inbound](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/is_security_group_rule) | resource |
| [ibm_is_security_group_rule.lb_outbound](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/is_security_group_rule) | resource |
| [ibm_is_security_group_rule.web_outbound](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/is_security_group_rule) | resource |
| [ibm_is_security_group_rule.web_rule_22](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/is_security_group_rule) | resource |
| [ibm_is_security_group_rule.web_rule_443](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/is_security_group_rule) | resource |
| [ibm_is_security_group_rule.web_rule_80](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/is_security_group_rule) | resource |
| [ibm_is_subnet.app_subnet](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/is_subnet) | resource |
| [ibm_is_subnet.bastion_sub](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/is_subnet) | resource |
| [ibm_is_subnet.db_subnet](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/is_subnet) | resource |
| [ibm_is_subnet.web_subnet](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/is_subnet) | resource |
| [ibm_is_volume.data_volume](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/is_volume) | resource |
| [ibm_is_vpc.vpc](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/is_vpc) | resource |
| [null_resource.delete_dynamic_ssh_key](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [null_resource.delete_dynamic_ssh_key_windows](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [null_resource.placement_group_validation_check_linux](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [null_resource.placement_group_validation_check_windows](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [null_resource.validation_check_1](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [null_resource.validation_check_2](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [null_resource.validation_check_3](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [null_resource.validation_check_4](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [null_resource.validation_check_5](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [null_resource.validation_check_6](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [null_resource.validation_check_7](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [null_resource.validation_check_8](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [time_sleep.wait_240_seconds](https://registry.terraform.io/providers/hashicorp/time/latest/docs/resources/sleep) | resource |
| [time_sleep.wait_600_seconds_app](https://registry.terraform.io/providers/hashicorp/time/latest/docs/resources/sleep) | resource |
| [ibm_iam_auth_token.auth_token](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/data-sources/iam_auth_token) | data source |
| [ibm_is_image.app_os](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/data-sources/is_image) | data source |
| [ibm_is_image.db_os](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/data-sources/is_image) | data source |
| [ibm_is_image.web_os](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/data-sources/is_image) | data source |
| [ibm_is_ssh_key.bastion_key_id](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/data-sources/is_ssh_key) | data source |
| [ibm_is_ssh_key.ssh_key_id](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/data-sources/is_ssh_key) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_alb_port"></a> [alb\_port](#input\_alb\_port) | This is the Application load balancer listener port | `number` | n/a | yes |
| <a name="input_api_key"></a> [api\_key](#input\_api\_key) | Please enter the IBM Cloud API key. | `string` | n/a | yes |
| <a name="input_app_image"></a> [app\_image](#input\_app\_image) | This variable will hold the image name for app instance | `string` | n/a | yes |
| <a name="input_app_lb_type"></a> [app\_lb\_type](#input\_app\_lb\_type) | This variable will decide the type of App Load Balancer. Allowed values are public or private. | `string` | n/a | yes |
| <a name="input_app_max_servers_count"></a> [app\_max\_servers\_count](#input\_app\_max\_servers\_count) | Maximum App servers count for the App Instance group | `number` | n/a | yes |
| <a name="input_app_os_type"></a> [app\_os\_type](#input\_app\_os\_type) | OS image to be used [windows \| linux] for App Server | `string` | n/a | yes |
| <a name="input_app_pg_strategy"></a> [app\_pg\_strategy](#input\_app\_pg\_strategy) | The strategy for App servers placement group - host\_spread: place on different compute hosts - power\_spread: place on compute hosts that use different power sources. | `string` | n/a | yes |
| <a name="input_app_profile"></a> [app\_profile](#input\_app\_profile) | This variable will hold the image profile name for app instance | `string` | n/a | yes |
| <a name="input_bandwidth"></a> [bandwidth](#input\_bandwidth) | Bandwidth per second in GB. The possible values are 3, 5 and 10 | `number` | n/a | yes |
| <a name="input_bastion_image"></a> [bastion\_image](#input\_bastion\_image) | Specify Image to be used with Bastion VSI | `string` | n/a | yes |
| <a name="input_bastion_ip_count"></a> [bastion\_ip\_count](#input\_bastion\_ip\_count) | IP count is the total number of total\_ipv4\_address\_count for Bastion Subnet | `number` | n/a | yes |
| <a name="input_bastion_os_type"></a> [bastion\_os\_type](#input\_bastion\_os\_type) | OS image to be used [windows \| linux] | `string` | n/a | yes |
| <a name="input_bastion_profile"></a> [bastion\_profile](#input\_bastion\_profile) | Specify the profile needed for Bastion VSI | `string` | n/a | yes |
| <a name="input_bastion_ssh_key"></a> [bastion\_ssh\_key](#input\_bastion\_ssh\_key) | This is the name of the ssh key which will be generated dynamically on the bastion server and further will be attached with all the other Web/App/DB servers. It will be used to login to Web/App/DB servers via Bastion server only. | `string` | n/a | yes |
| <a name="input_cos_validation"></a> [cos\_validation](#input\_cos\_validation) | This variable will track cos variable validation checks | `any` | n/a | yes |
| <a name="input_data_vol_size"></a> [data\_vol\_size](#input\_data\_vol\_size) | Storage size in GB. The value should be between 10 and 2000 | `number` | n/a | yes |
| <a name="input_db_image"></a> [db\_image](#input\_db\_image) | Image for DB VSI | `string` | n/a | yes |
| <a name="input_db_name"></a> [db\_name](#input\_db\_name) | Database will be created with the specified name | `string` | n/a | yes |
| <a name="input_db_os_type"></a> [db\_os\_type](#input\_db\_os\_type) | OS image to be used [windows \| linux] for DB Server | `string` | n/a | yes |
| <a name="input_db_pg_strategy"></a> [db\_pg\_strategy](#input\_db\_pg\_strategy) | The strategy for Database servers placement group - host\_spread: place on different compute hosts - power\_spread: place on compute hosts that use different power sources. | `string` | n/a | yes |
| <a name="input_db_private_ip"></a> [db\_private\_ip](#input\_db\_private\_ip) | This variable contains the value of DB private IP which is used for connection. | `string` | n/a | yes |
| <a name="input_db_profile"></a> [db\_profile](#input\_db\_profile) | DB Profile | `string` | n/a | yes |
| <a name="input_db_pwd"></a> [db\_pwd](#input\_db\_pwd) | Database user will be created with the specified password | `string` | n/a | yes |
| <a name="input_db_user"></a> [db\_user](#input\_db\_user) | Database user will be created with the specified name | `string` | n/a | yes |
| <a name="input_db_vsi_count"></a> [db\_vsi\_count](#input\_db\_vsi\_count) | Total Database instances that will be created in the user specified zone. | `number` | n/a | yes |
| <a name="input_enable_automation"></a> [enable\_automation](#input\_enable\_automation) | Determines whether to enable Automation or not. Give true or false. | `bool` | n/a | yes |
| <a name="input_enable_autoscaling"></a> [enable\_autoscaling](#input\_enable\_autoscaling) | Determines whether to enable IG or not. Give true or false. | `bool` | n/a | yes |
| <a name="input_enable_floating_ip"></a> [enable\_floating\_ip](#input\_enable\_floating\_ip) | Determines whether to enable floating IP for Bastion server or not. Give true or false. | `bool` | n/a | yes |
| <a name="input_enable_public_gateway"></a> [enable\_public\_gateway](#input\_enable\_public\_gateway) | Determines whether to create Public Gateway or not. Give true or false. | `bool` | n/a | yes |
| <a name="input_ip_count"></a> [ip\_count](#input\_ip\_count) | This map contains total number of IP Address for each subnet present in each tier web, app and db | `map(any)` | n/a | yes |
| <a name="input_lb_algo"></a> [lb\_algo](#input\_lb\_algo) | lbaaS backend distribution algorithm | `map(any)` | n/a | yes |
| <a name="input_lb_port_number"></a> [lb\_port\_number](#input\_lb\_port\_number) | declare lbaaS pool member port number | `map(any)` | n/a | yes |
| <a name="input_lb_protocol"></a> [lb\_protocol](#input\_lb\_protocol) | lbaaS protocols | `map(any)` | n/a | yes |
| <a name="input_local_machine_os_type"></a> [local\_machine\_os\_type](#input\_local\_machine\_os\_type) | Operating System to be used [windows \| mac \| linux] for your local machine which is running terraform apply | `string` | n/a | yes |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | Prefix for all the resources. | `string` | n/a | yes |
| <a name="input_public_gateway_id"></a> [public\_gateway\_id](#input\_public\_gateway\_id) | Id of the public gateway where subnets will get attached | `string` | n/a | yes |
| <a name="input_public_ip_address_list"></a> [public\_ip\_address\_list](#input\_public\_ip\_address\_list) | Provide the User's Public IP address in the format X.X.X.X/32 which will be used to login to Bastion VSI. Also Please update your changed public IP address everytime before executing terraform apply | `list(any)` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | Please enter a region from the following available region and zones mapping: <br>us-south<br>us-east<br>eu-gb<br>eu-de<br>jp-tok<br>au-syd | `string` | n/a | yes |
| <a name="input_regions"></a> [regions](#input\_regions) | Region and Zones mapping | `map(any)` | <pre>{<br>  "au-syd-1": "au-syd",<br>  "au-syd-2": "au-syd",<br>  "au-syd-3": "au-syd",<br>  "br-sao-1": "br-sao",<br>  "br-sao-2": "br-sao",<br>  "br-sao-3": "br-sao",<br>  "ca-tor-1": "ca-tor",<br>  "ca-tor-2": "ca-tor",<br>  "ca-tor-3": "ca-tor",<br>  "eu-de-1": "eu-de",<br>  "eu-de-2": "eu-de",<br>  "eu-de-3": "eu-de",<br>  "eu-gb-1": "eu-gb",<br>  "eu-gb-2": "eu-gb",<br>  "eu-gb-3": "eu-gb",<br>  "jp-osa-1": "jp-osa",<br>  "jp-osa-2": "jp-osa",<br>  "jp-osa-3": "jp-osa",<br>  "jp-tok-1": "jp-tok",<br>  "jp-tok-2": "jp-tok",<br>  "jp-tok-3": "jp-tok",<br>  "us-east-1": "us-east",<br>  "us-east-2": "us-east",<br>  "us-east-3": "us-east",<br>  "us-south-1": "us-south",<br>  "us-south-2": "us-south",<br>  "us-south-3": "us-south"<br>}</pre> | no |
| <a name="input_reregister_rhel"></a> [reregister\_rhel](#input\_reregister\_rhel) | Reregister script for rhel 7.9 for mirror yum repos | `string` | n/a | yes |
| <a name="input_resource_group_id"></a> [resource\_group\_id](#input\_resource\_group\_id) | Resource Group ID is used to seperate the resources in a group. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | The user tags to attach to the placement group. | `list(any)` | `null` | no |
| <a name="input_tiered_profiles"></a> [tiered\_profiles](#input\_tiered\_profiles) | Tiered profiles for Input/Output per seconds in GBs | `map(any)` | n/a | yes |
| <a name="input_user_ssh_keys"></a> [user\_ssh\_keys](#input\_user\_ssh\_keys) | This is the existing ssh key on the User's machine and will be attached with the bastion server only. This will ensure the incoming connection on Bastion Server only from the users provided ssh\_keys | `string` | n/a | yes |
| <a name="input_web_image"></a> [web\_image](#input\_web\_image) | This variable will hold the image name for web instance | `string` | n/a | yes |
| <a name="input_web_lb_hostname"></a> [web\_lb\_hostname](#input\_web\_lb\_hostname) | Web Load balancer hostname | `string` | n/a | yes |
| <a name="input_web_lb_type"></a> [web\_lb\_type](#input\_web\_lb\_type) | This variable will decide the type of Web Load Balancer. Allowed values are public or private. | `string` | n/a | yes |
| <a name="input_web_max_servers_count"></a> [web\_max\_servers\_count](#input\_web\_max\_servers\_count) | Maximum Web servers count for the Web Instance group | `number` | n/a | yes |
| <a name="input_web_os_type"></a> [web\_os\_type](#input\_web\_os\_type) | OS image to be used [windows \| linux] for Web Server | `string` | n/a | yes |
| <a name="input_web_pg_strategy"></a> [web\_pg\_strategy](#input\_web\_pg\_strategy) | The strategy for Web servers placement group - host\_spread: place on different compute hosts - power\_spread: place on compute hosts that use different power sources. | `string` | n/a | yes |
| <a name="input_web_profile"></a> [web\_profile](#input\_web\_profile) | This variable will hold the image profile name for web instance | `string` | n/a | yes |
| <a name="input_wp_admin_email"></a> [wp\_admin\_email](#input\_wp\_admin\_email) | Email of the Admin User for the wordpress website | `string` | n/a | yes |
| <a name="input_wp_admin_password"></a> [wp\_admin\_password](#input\_wp\_admin\_password) | Password of the Admin User for the wordpress website | `string` | n/a | yes |
| <a name="input_wp_admin_user"></a> [wp\_admin\_user](#input\_wp\_admin\_user) | Name of the Admin User of the wordpress website | `string` | n/a | yes |
| <a name="input_wp_blog_title"></a> [wp\_blog\_title](#input\_wp\_blog\_title) | Title of the website or blog | `string` | n/a | yes |
| <a name="input_zone"></a> [zone](#input\_zone) | The zone where the subnet will be created | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_app_pg_id"></a> [app\_pg\_id](#output\_app\_pg\_id) | Placement group ID for App servers |
| <a name="output_app_target"></a> [app\_target](#output\_app\_target) | Target primary network interface address |
| <a name="output_bastion_ip"></a> [bastion\_ip](#output\_bastion\_ip) | Bastion Server Floating IP Address |
| <a name="output_bastion_key_id"></a> [bastion\_key\_id](#output\_bastion\_key\_id) | This variable will return the SSH key id created by Bastion server |
| <a name="output_bastion_sg"></a> [bastion\_sg](#output\_bastion\_sg) | Security Group id for the bastion |
| <a name="output_db_pg_id"></a> [db\_pg\_id](#output\_db\_pg\_id) | Placement group ID for Database servers |
| <a name="output_db_target"></a> [db\_target](#output\_db\_target) | Target primary network interface address |
| <a name="output_db_vsi"></a> [db\_vsi](#output\_db\_vsi) | Target primary network interface address |
| <a name="output_lb_dns"></a> [lb\_dns](#output\_lb\_dns) | Private IP for App, DB and Web Server |
| <a name="output_lb_private_ip"></a> [lb\_private\_ip](#output\_lb\_private\_ip) | Private IP for App and DB Server |
| <a name="output_lb_public_ip"></a> [lb\_public\_ip](#output\_lb\_public\_ip) | Public IP for Web Server |
| <a name="output_objects"></a> [objects](#output\_objects) | This variable will contains the objects of LB, LB Pool and LB Listeners. |
| <a name="output_sg_objects"></a> [sg\_objects](#output\_sg\_objects) | This output variable will expose the objects of all security groups |
| <a name="output_sub_objects"></a> [sub\_objects](#output\_sub\_objects) | This output variable will expose the objects of all subnets |
| <a name="output_vpc"></a> [vpc](#output\_vpc) | This variable will display the vpc created |
| <a name="output_web_pg_id"></a> [web\_pg\_id](#output\_web\_pg\_id) | Placement group ID for Web servers |
| <a name="output_web_target"></a> [web\_target](#output\_web\_target) | Target primary network interface address |
