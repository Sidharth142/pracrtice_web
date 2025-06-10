
resource "aws_kms_key" "s3_bucket" {
  description         = "KMS key for ECR repositories"
  enable_key_rotation = true
  tags                = local.tags
}

resource "aws_kms_alias" "s3_bucket_alias" {
  name          = "alias/ecr"
  target_key_id = aws_kms_key.s3_bucket.key_id
}