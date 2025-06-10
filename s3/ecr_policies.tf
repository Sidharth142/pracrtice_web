data "aws_iam_policy_document" "bucket_policy" {
  statement {
    sid    = "AllowAdminRoleAccess"
    effect = "Allow"

    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::222222222222:root"] # Replace with your actual role ARN
    }

    # actions = [
    #   "ecr:GetDownloadUrlForLayer",
    #   "ecr:BatchGetImage",
    #   "ecr:BatchCheckLayerAvailability"
    # ]
     actions = ["s3:*"]

    #resources = ["*"]
    resources = [
  "arn:aws:s3:::s3-webfader-gitlab-runner",
  "arn:aws:s3:::s3-webfader-gitlab-runner/*"
]

  }
}



















