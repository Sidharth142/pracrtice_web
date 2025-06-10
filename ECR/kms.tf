
resource "aws_kms_key" "ecr" {
  description         = "KMS key for ECR repositories"
  enable_key_rotation = true
  tags                = local.tags
}

resource "aws_kms_alias" "ecr_alias" {
  name          = "alias/ecr"
  target_key_id = aws_kms_key.ecr.key_id
}