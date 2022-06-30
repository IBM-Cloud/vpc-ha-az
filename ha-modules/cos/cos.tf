/**
#################################################################################################################
*                           Resources Section for the COS Bucket Module.
#################################################################################################################
*/

/**
* COS Instance
* Element : resource_instance
* This resource will be used to create a resource instance.
**/
resource "ibm_resource_instance" "cos_instance" {
  count             = var.enable_cos ? 1 : 0
  name              = "${var.prefix}instance"
  resource_group_id = var.resource_group_id
  plan              = var.cos_bucket_plan
  location          = "global"
  service           = "cloud-object-storage"
  tags              = var.tags
  depends_on        = [null_resource.validation_check_6, var.vpc]
}

/**
* COS Bucket
* Element : cos_bucket
* This resource will be used to create a COS Bucket.
**/
resource "ibm_cos_bucket" "cos_bucket" {
  count                 = var.enable_cos ? 1 : 0
  bucket_name           = "${var.prefix}bucket"
  resource_instance_id  = ibm_resource_instance.cos_instance[0].id
  cross_region_location = var.cross_region_location
  storage_class         = var.storage_class
  depends_on            = [ibm_resource_instance.cos_instance]
}

/**
* COS Bucket Object
* Element : cos_object
* This resource will be used to create a COS Bucket Object.
**/
resource "ibm_cos_bucket_object" "cos_object" {
  count           = var.enable_cos ? 1 : 0
  bucket_crn      = ibm_cos_bucket.cos_bucket[0].crn
  bucket_location = var.bucket_location
  key             = var.obj_key
  content         = var.obj_content
  depends_on      = [ibm_cos_bucket.cos_bucket]
}
