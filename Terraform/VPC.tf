# Create VPC
resource "aws_vpc" "VPC_ECR" {
  cidr_block       = "10.0.0.0/20"
  instance_tenancy = "default"
  tags   = {
    Name = "VPC for ECR"
  }
}

resource "aws_internet_gateway" "VPC_IGW" {
  vpc_id = aws_vpc.VPC_ECR.id
}

# VPC Public Subnet 1
resource "aws_subnet" "Public1" {
  vpc_id                  = aws_vpc.VPC_ECR.id
  cidr_block              = "10.0.0.0/26"
  map_public_ip_on_launch = true
  availability_zone       = "eu-central-1a"
  tags   = {
    Name = "VPC_Public1"
  }
}

# VPC Public Subnet 2
resource "aws_subnet" "Public2" {
  vpc_id                  = aws_vpc.VPC_ECR.id
  cidr_block              = "10.0.1.0/26"
  map_public_ip_on_launch = true
  availability_zone       = "eu-central-1b"
  tags   = {
    Name = "VPC_Public2"
  }
}

# Route Table for VPC
resource "aws_route_table" "VPC_RT" {
  vpc_id       = aws_vpc.VPC_ECR.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.VPC_IGW.id
  }
  tags   = {
    Name = "ECR_VPC_RT"
  }
}

resource "aws_route_table_association" "CentralFirstPublic_SubnetRTassociation" {
  subnet_id      = aws_subnet.Public1.id
  route_table_id = aws_route_table.VPC_RT.id
}

resource "aws_route_table_association" "CentralSecondPublic_SubnetRTassociation" {
  subnet_id      = aws_subnet.Public2.id
  route_table_id = aws_route_table.VPC_RT.id
}