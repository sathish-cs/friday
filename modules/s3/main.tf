resource "aws_s3_bucket" "s3_bucket_hour" {
  bucket        = var.s3_bucket_hour
  acl           = var.acl
  force_destroy = var.destroy
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
    id      = "blog"
    enabled = true

    prefix = "blog/"

    transition {
      days          = 30
      storage_class = "STANDARD_IA" # or "ONEZONE_IA"
    }

    transition {
      days          = 60
      storage_class = "GLACIER"
    }

    expiration {
      days = 90
    }
  }
}


resource "aws_s3_bucket" "s3_bucket_week" {
  bucket        = var.s3_bucket_week
  acl           = var.acl
  force_destroy = var.destroy
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

    prefix = "videos/"


    expiration {
      days = 90
   
    }
  }
}

resource "aws_s3_bucket" "s3_bucket_month" {
  bucket        = var.s3_bucket_month
  acl           = var.acl
  force_destroy = var.destroy
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
      storage_class = "ONEZONE_IA"
    }

    expiration {
      days = 90
    }
  }
}
