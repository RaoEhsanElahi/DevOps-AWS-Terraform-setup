# Key Pair for EC2 Instances
resource "aws_key_pair" "cs423_assignment4_key" {
  key_name   = "cs423-assignment4-key"
  public_key = file("~/.ssh/cs423-assignment4-key.pub")
}
