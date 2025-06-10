locals {
  tags = {
    Project     = var.project
    Environment = var.env
    Description = "Created by Terraform"
  }
}