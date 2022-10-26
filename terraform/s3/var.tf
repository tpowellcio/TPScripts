# Prompt user for bucket name
variable "bucket_name" {}
# Disable publick access
variable "acl_value" {
  default = "private"
}
# Disable Versioning
variable "versioning_value" {
  default = false
}
# Set Region
variable "region" {
  default = "us-west-1"
}
