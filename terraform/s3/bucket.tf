terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# provider method
provider "aws" {
  region = "${var.region}"
}

# Module method
module "s3_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"

  bucket = "${var.bucket_name}"
  acl    = "${var.acl_value}"

  versioning = {
    enabled = "${var.versioning_value}"
  }
}
