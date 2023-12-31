terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region     = "us-east-2"
  access_key = "ACCESS_KEY"
  secret_key = "SECRET_KEY"
}

resource "aws_iam_user" "terraform_user" {
  name = "terraform-cs423-devops"
}

resource "aws_iam_user_policy_attachment" "admin_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
  user       = aws_iam_user.terraform_user.name
}

resource "aws_iam_access_key" "terraform_user_key" {
  user = aws_iam_user.terraform_user.name
}

