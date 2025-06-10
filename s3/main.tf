module "s3_bucket" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  bucket  = "s3-sidhu-gitlab-runner"

  allowed_kms_key_arn = aws_kms_key.s3_bucket.arn
  attach_policy       = true
  policy              = data.aws_iam_policy_document.bucket_policy.json

  versioning = {
    enabled = false
  }

  server_side_encryption_configuration = {
    rule = {
      apply_server_side_encryption_by_default = {
        sse_algorithm     = "aws:kms"
        kms_master_key_id = aws_kms_key.s3_bucket.arn
      }
    }
  }

  lifecycle_rule = [
    {
      id      = "expire-objects"
      enabled = true

      expiration = {
        days = 7
      }

      filter = {
        prefix = ""
      }
    }
  ]
}
