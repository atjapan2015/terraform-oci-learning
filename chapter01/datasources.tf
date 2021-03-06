data "oci_identity_availability_domain" "tf_example_ad" {
  compartment_id = var.tenancy_ocid
  ad_number      = 1
}

# Get the latest Oracle Linux image
data "oci_core_images" "tf_example_supported_platform_config_shape_images" {
  compartment_id           = var.compartment_ocid
  operating_system         = var.instance_os
  operating_system_version = var.linux_os_version
  shape                    = var.instance_shape

  filter {
    name   = "display_name"
    values = ["^.*Oracle[^G]*$"]
    regex  = true
  }
}