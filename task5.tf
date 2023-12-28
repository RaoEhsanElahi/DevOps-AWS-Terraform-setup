# Output for Public and Private IP addresses of EC2 instances
output "web_server_public_ip" {
  value = aws_instance.server_instance.public_ip
}

output "web_server_private_ip" {
  value = aws_instance.server_instance.private_ip
}

output "database_server_public_ip" {
  value = aws_instance.database_instance.public_ip
}

output "database_server_private_ip" {
  value = aws_instance.database_instance.private_ip
}

# Output for IAM user details

output "iam_user_details" {
  value = {
    name                 = aws_iam_user.terraform_user.name
    arn                  = aws_iam_user.terraform_user.arn
    path                 = aws_iam_user.terraform_user.path
    permissions_boundary = aws_iam_user.terraform_user.permissions_boundary
  }
  description = "IAM user details"
}
