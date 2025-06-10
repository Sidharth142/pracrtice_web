module "sidhu_base_image_php" {
  source = "terraform-aws-modules/ecr/aws"

  repository_name                 = "sidhu-base-image-php"
  repository_image_tag_mutability = "MUTABLE"
  repository_force_delete         = true
  repository_encryption_type      = "KMS"
  repository_kms_key              = aws_kms_key.ecr.arn
  repository_policy               = data.aws_iam_policy_document.registry_policy.json
  create_lifecycle_policy         = false

  tags = local.tags
}


module "sidhu_backend" {
  source = "terraform-aws-modules/ecr/aws"

  repository_name                 = "sidhu_backend"
  repository_image_tag_mutability = "MUTABLE"
  repository_force_delete         = true
  repository_encryption_type      = "KMS"
  repository_kms_key              = aws_kms_key.ecr.arn
  repository_policy               = data.aws_iam_policy_document.registry_policy.json
  create_lifecycle_policy         = false

  tags = local.tags
}




