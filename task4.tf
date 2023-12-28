# EC2 Instances
resource "aws_instance" "server_instance" {
  ami                    = "ami-05fb0b8c1424f266b"
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.cs423_assignment4_key.key_name
  subnet_id              = aws_subnet.public_subnet_1.id
  vpc_security_group_ids = [aws_security_group.ec2_security_group.id]

  user_data = <<-EOF
              #!/bin/bash
              apt-get update
              apt-get install -y apache2
              systemctl start apache2 
              systemctl enable apache2 
              EOF

  tags = {
    Name = "server-instance"
  }

  associate_public_ip_address = true

}

resource "aws_instance" "database_instance" {
  ami                    = "ami-05fb0b8c1424f266b"
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.cs423_assignment4_key.key_name
  subnet_id              = aws_subnet.private_subnet_1.id
  vpc_security_group_ids = [aws_security_group.ec2_security_group.id]

  user_data = <<-EOF
              #!/bin/bash
              sudo apt-get update
              sudo apt-get install -y mysql-server
              sudo systemctl start mysql
              sudo systemctl enable mysql
              EOF

  tags = {
    Name = "database-instance"
  }

  associate_public_ip_address = true
}
output "web_server_url" {
  value       = "http://${aws_instance.server_instance.public_ip}:80"
  description = "URL to access the web server"
}
