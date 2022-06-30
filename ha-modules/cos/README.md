## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_ibm"></a> [ibm](#provider\_ibm) | n/a |
| <a name="provider_null"></a> [null](#provider\_null) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [ibm_cos_bucket.cos_bucket](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/cos_bucket) | resource |
| [ibm_cos_bucket_object.cos_object](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/cos_bucket_object) | resource |
| [ibm_resource_instance.cos_instance](https://registry.terraform.io/providers/IBM-Cloud/ibm/latest/docs/resources/resource_instance) | resource |
| [null_resource.validation_check_1](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [null_resource.validation_check_2](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [null_resource.validation_check_3](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [null_resource.validation_check_4](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [null_resource.validation_check_5](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [null_resource.validation_check_6](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_api_key"></a> [api\_key](#input\_api\_key) | Please enter the IBM Cloud API key. | `string` | n/a | yes |
| <a name="input_bucket_location"></a> [bucket\_location](#input\_bucket\_location) | The location of the COS bucket | `string` | n/a | yes |
| <a name="input_cos_bucket_plan"></a> [cos\_bucket\_plan](#input\_cos\_bucket\_plan) | Please enter plan name for COS bucket. Possible value is <br>1:lite<br>2:standard | `string` | n/a | yes |
| <a name="input_cross_region_location"></a> [cross\_region\_location](#input\_cross\_region\_location) | Cross Region service provides higher durability and availability than using a single region, at the cost of slightly higher latency. This service is available today in the U.S., E.U., and A.P. areas. | `string` | n/a | yes |
| <a name="input_enable_cos"></a> [enable\_cos](#input\_enable\_cos) | Determines whether to create COS bucket or not. Give true or false. | `bool` | n/a | yes |
| <a name="input_obj_content"></a> [obj\_content](#input\_obj\_content) | Literal string value to use as an object content, which will be uploaded as UTF-8 encoded text. Conflicts with content\_base64 and content\_file | `string` | n/a | yes |
| <a name="input_obj_key"></a> [obj\_key](#input\_obj\_key) | The name of an object in the COS bucket. This is used to identify our object. | `string` | n/a | yes |
| <a name="input_prefix"></a> [prefix](#input\_prefix) | Prefix for all the resources. | `string` | n/a | yes |
| <a name="input_regions"></a> [regions](#input\_regions) | Region and Zones mapping | `map(any)` | <pre>{<br>  "au-syd-1": "au-syd",<br>  "au-syd-2": "au-syd",<br>  "au-syd-3": "au-syd",<br>  "br-sao-1": "br-sao",<br>  "br-sao-2": "br-sao",<br>  "br-sao-3": "br-sao",<br>  "ca-tor-1": "ca-tor",<br>  "ca-tor-2": "ca-tor",<br>  "ca-tor-3": "ca-tor",<br>  "eu-de-1": "eu-de",<br>  "eu-de-2": "eu-de",<br>  "eu-de-3": "eu-de",<br>  "eu-gb-1": "eu-gb",<br>  "eu-gb-2": "eu-gb",<br>  "eu-gb-3": "eu-gb",<br>  "jp-osa-1": "jp-osa",<br>  "jp-osa-2": "jp-osa",<br>  "jp-osa-3": "jp-osa",<br>  "jp-tok-1": "jp-tok",<br>  "jp-tok-2": "jp-tok",<br>  "jp-tok-3": "jp-tok",<br>  "us-east-1": "us-east",<br>  "us-east-2": "us-east",<br>  "us-east-3": "us-east",<br>  "us-south-1": "us-south",<br>  "us-south-2": "us-south",<br>  "us-south-3": "us-south"<br>}</pre> | no |
| <a name="input_resource_group_id"></a> [resource\_group\_id](#input\_resource\_group\_id) | Resource Group ID is used to separate the resources in a group. | `string` | n/a | yes |
| <a name="input_storage_class"></a> [storage\_class](#input\_storage\_class) | Storage class helps in choosing a right storage plan and location and helps in reducing the cost. | `string` | n/a | yes |
| <a name="input_vpc"></a> [vpc](#input\_vpc) | Required parameter vpc | `any` | n/a | yes |
| <a name="input_zone"></a> [zone](#input\_zone) | Resources will be created in the user specified zone | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cos_validation"></a> [cos\_validation](#output\_cos\_validation) | This variable will track cos variable validation checks |
| <a name="output_object_endpoint"></a> [object\_endpoint](#output\_object\_endpoint) | n/a |
