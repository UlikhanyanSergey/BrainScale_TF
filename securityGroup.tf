# Security group "Allowed ports IPv4"
resource "aws_security_group" "SecGroup" {
  name              = "SecGroup"
  description       = "Allow inbound traffic"
  vpc_id            = aws_vpc.VPC_ECR.id
  dynamic "ingress" {
    for_each        = ["22", "80", "3000"]
    content {
      from_port     = ingress.value
      to_port       = ingress.value
      protocol      = "tcp"
      cidr_blocks   = ["0.0.0.0/0"]
    }
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  tags   = {
    name = "SecurityGroup"
  }
}



