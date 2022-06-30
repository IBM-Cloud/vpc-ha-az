## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_ibm"></a> [ibm](#provider\_ibm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [ibm_is_public_gateway.pg](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/is_public_gateway) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_api_key"></a> [api\_key](#input\_api\_key) | Please enter the IBM Cloud API key. | `string` | n/a | yes |
| <a name="input_enable_public_gateway"></a> [enable\_public\_gateway](#input\_enable\_public\_gateway) | Determines whether to create Public Gateway or not. Give true or false. | `bool` | n/a | yes |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | Prefix for all the resources. | `string` | n/a | yes |
| <a name="input_regions"></a> [regions](#input\_regions) | Region and Zones mapping | `map(any)` | <pre>{<br>  "au-syd-1": "au-syd",<br>  "au-syd-2": "au-syd",<br>  "au-syd-3": "au-syd",<br>  "br-sao-1": "br-sao",<br>  "br-sao-2": "br-sao",<br>  "br-sao-3": "br-sao",<br>  "ca-tor-1": "ca-tor",<br>  "ca-tor-2": "ca-tor",<br>  "ca-tor-3": "ca-tor",<br>  "eu-de-1": "eu-de",<br>  "eu-de-2": "eu-de",<br>  "eu-de-3": "eu-de",<br>  "eu-gb-1": "eu-gb",<br>  "eu-gb-2": "eu-gb",<br>  "eu-gb-3": "eu-gb",<br>  "jp-osa-1": "jp-osa",<br>  "jp-osa-2": "jp-osa",<br>  "jp-osa-3": "jp-osa",<br>  "jp-tok-1": "jp-tok",<br>  "jp-tok-2": "jp-tok",<br>  "jp-tok-3": "jp-tok",<br>  "us-east-1": "us-east",<br>  "us-east-2": "us-east",<br>  "us-east-3": "us-east",<br>  "us-south-1": "us-south",<br>  "us-south-2": "us-south",<br>  "us-south-3": "us-south"<br>}</pre> | no |
| <a name="input_resource_group_id"></a> [resource\_group\_id](#input\_resource\_group\_id) | Resource Group ID is used to separate the resources in a group. | `string` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | Required parameter vpc\_id | `string` | n/a | yes |
| <a name="input_zone"></a> [zone](#input\_zone) | The zone where the public gateway will be created | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_pg_id"></a> [pg\_id](#output\_pg\_id) | n/a |
