resource "random_uuid" "bucket_name" {}

resource "aws_s3_bucket" "private_bucket" {
  bucket        = "${var.env}-${random_uuid.bucket_name.result}"
  force_destroy = var.s3_force_destroy
}

resource "aws_s3_bucket_versioning" "s3_versioning_configuration" {
  bucket = aws_s3_bucket.private_bucket.id
  versioning_configuration {
    status = var.s3_versioning_configuration
  }
}
resource "aws_s3_bucket_lifecycle_configuration" "s3_lifecycle_policy" {
  bucket = aws_s3_bucket.private_bucket.id

  rule {
    id     = var.transition_to_ia_id
    status = var.transition_to_ia_status

    transition {
      days          = var.transition_to_ia_transition_duration
      storage_class = var.transition_to_ia_transition_storage_class
    }
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "s3_default_encryption" {
  bucket = aws_s3_bucket.private_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = var.sse_algorithm
    }
  }
}

resource "aws_s3_bucket_public_access_block" "s3_bucket_public_access_block" {
  bucket                  = aws_s3_bucket.private_bucket.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_acl" "private_bucket_acl" {
  bucket = aws_s3_bucket.private_bucket.id
  acl    = var.acl
}