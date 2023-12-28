# VPC Configuration
resource "aws_vpc" "new_vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "devops-assignment-4"
  }
}

# Public Subnets Configuration
resource "aws_subnet" "public_subnet_1" {
  vpc_id            = aws_vpc.new_vpc.id
  cidr_block        = "10.0.0.0/24"
  availability_zone = "us-east-2a"

  tags = {
    Name = "public_subnet_1"
  }
}
resource "aws_subnet" "private_subnet_1" {
  vpc_id            = aws_vpc.new_vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-2a"

  tags = {
    Name = "private_subnet_1"
  }
}

resource "aws_subnet" "public_subnet_2" {
  vpc_id            = aws_vpc.new_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-2b"

  tags = {
    Name = "public_subnet_2"
  }
}
resource "aws_subnet" "private_subnet_2" {
  vpc_id            = aws_vpc.new_vpc.id
  cidr_block        = "10.0.3.0/24"
  availability_zone = "us-east-2b"

  tags = {
    Name = "private_subnet_2"
  }
}

# Internet Gateway Configuration
resource "aws_internet_gateway" "internet_gw" {
  vpc_id = aws_vpc.new_vpc.id

  tags = {
    Name = "internet-gateway-cs423-devops"
  }
}

# Public Internet Access Route Configuration
resource "aws_route" "public_internet_access" {
  route_table_id         = aws_vpc.new_vpc.main_route_table_id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.internet_gw.id
}

# Private Route Table Configuration
resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.new_vpc.id

  tags = {
    Name = "private-route-table-cs423-devops"
  }
}

# Route Table Associations Configuration
resource "aws_route_table_association" "public_subnet_1_association" {
  subnet_id      = aws_subnet.public_subnet_1.id
  route_table_id = aws_vpc.new_vpc.main_route_table_id
}

resource "aws_route_table_association" "public_subnet_2_association" {
  subnet_id      = aws_subnet.public_subnet_2.id
  route_table_id = aws_vpc.new_vpc.main_route_table_id
}

resource "aws_route_table_association" "private_subnet_1_association" {
  subnet_id      = aws_subnet.private_subnet_1.id
  route_table_id = aws_route_table.private_route_table.id
}

resource "aws_route_table_association" "private_subnet_2_association" {
  subnet_id      = aws_subnet.private_subnet_2.id
  route_table_id = aws_route_table.private_route_table.id
}
