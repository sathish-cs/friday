resource "aws_s3_bucket" "s3_bucket_hour" {
  bucket        = var.s3_bucket_hour # Bucket_name takes value from variable
  acl           = var.acl
  force_destroy = var.destroy # Objects should be deleted before delete the s3 bucket
  versioning {
    enabled = var.versioning # Enable versioning for objects
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm     = var.sse_algorithm # Encrypt objects at rest
      }

    }
  }

  lifecycle_rule {
    id      = "blog"
    enabled = true

    prefix = "blog/" # lifecycle rule only applies to /blog path

    transition {
      days          = 30 # Change storage class to STANDARD_IA older than 30 days
      storage_class = "STANDARD_IA"
    }

    transition {
      days          = 60 # Change storage class to Glacier older than 60 days
      storage_class = "GLACIER"
    }

    expiration {
      days = 90 # remove objects older than 90 days
    }
  }
}


resource "aws_s3_bucket" "s3_bucket_week" {
  bucket        = var.s3_bucket_week # Bucket_name takes value from variable
  acl           = var.acl
  force_destroy = var.destroy # Objects should be deleted before delete the s3 bucket
  versioning {
    enabled = var.versioning
  }
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm     = var.sse_algorithm
      }
    }
  }
  lifecycle_rule {
    id      = "videos" 
    enabled = true

    prefix = "videos/" # lifecycle rule only applies to /videos path


    expiration {
      days = 90 # remove objects older than 90 days
   
    }
  }
}

resource "aws_s3_bucket" "s3_bucket_month" {
  bucket        = var.s3_bucket_month # Bucket_name takes value from variable
  acl           = var.acl
  force_destroy = var.destroy # Objects should be deleted before delete the s3 bucket
  versioning {
    enabled = var.versioning
  }
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm     = var.sse_algorithm
      }
    }
  }
  lifecycle_rule {
    id      = "images"
    enabled = true

    prefix = "images/"

    transition {
      days          = 30
      storage_class = "ONEZONE_IA" # # Change storage class to Onezone_IA older than 30 days
    }

    expiration {
      days = 90 # remove objects older than 90 days
    }
  }
}
