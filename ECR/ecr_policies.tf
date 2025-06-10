data "aws_iam_policy_document" "registry_policy" {
  statement {
    sid    = "AllowAdminRoleAccess"
    effect = "Allow"

    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::222222222222:role/admin"] # Replace with your actual role ARN
    }

    # actions = [
    #   "ecr:GetDownloadUrlForLayer",
    #   "ecr:BatchGetImage",
    #   "ecr:BatchCheckLayerAvailability"
    # ]
    actions = ["ecr:*"]

    resources = ["*"]
  }
}



















