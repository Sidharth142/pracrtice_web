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




# module "ark_base_image_php" {
#   source = "terraform-aws-modules/ecr/aws"  

#   repository_name                 = "ark-base-image-php"
#   repository_image_tag_mutability = "MUTABLE"
#   repository_force_delete         = true
#   repository_encryption_configuration = {
#     encryption_type = "KMS"
#     kms_key         = aws_kms_key.ecr.arn
#   }
#   repository_policy_text = data.aws_iam_policy_document.registry_policy.json

#   tags = local.tags
# }


# module "ark_backend" {
#   source = "terraform-aws-modules/ecr/aws"

#   repository_name                    = "ark-backend"
#   repository_image_tag_mutability   = "MUTABLE"
#   repository_force_delete           = true
#   repository_encryption_configuration = {
#     encryption_type = "KMS"
#     kms_key         = aws_kms_key.ecr.arn
#   }

#   repository_policy_text = data.aws_iam_policy_document.registry_policy.json
#   tags = local.tags
# }

# module "ecr" {
#   source = "terraform-aws-modules/ecr/aws"

#   repository_name = "private-example"

#   repository_read_write_access_arns = ["arn:aws:iam::012345678901:role/terraform"]
#   create_lifecycle_policy           = false

#   tags       = local.tags
# }