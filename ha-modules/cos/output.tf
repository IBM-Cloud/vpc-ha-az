/**
#################################################################################################################
*                                 COS Bucket Output Variable Section
#################################################################################################################
**/

/**
* Output Variable
* Element: COS Public and Private endpoint
* Desc: This variable will return the public and private end points for the COS bucket.
**/
output "object_endpoint" {
  value = var.enable_cos ? merge(
    { "PRI_ENDPOINT" = "${ibm_cos_bucket.cos_bucket[0].s3_endpoint_private}/${ibm_cos_bucket.cos_bucket[0].bucket_name}/${ibm_cos_bucket_object.cos_object[0].key}" },
    { "PUB_ENDPOINT" = "${ibm_cos_bucket.cos_bucket[0].s3_endpoint_public}/${ibm_cos_bucket.cos_bucket[0].bucket_name}/${ibm_cos_bucket_object.cos_object[0].key}" }
  ) : null
}

/**
* Output Variable
* Element: COS Validation
* Desc: This variable will track cos variable validation checks.
**/
output "cos_validation" {
  description = "This variable will track cos variable validation checks"
  value       = null_resource.validation_check_6
}

