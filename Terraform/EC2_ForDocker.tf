#EC2 instance to create Docker image and push it on ECR

resource "aws_instance" "ec2_instance" {
  ami                    = var.image_id
  instance_type          = var.instance_type
  iam_instance_profile   = aws_iam_instance_profile.ecr_full_access_profile.name
  key_name               = var.key
  subnet_id              = aws_subnet.Public1.id
  vpc_security_group_ids = [aws_security_group.SecGroup.id]
  user_data              = filebase64("../UserData/user_data_EC2.sh")
  tags = {
    Name = "DockerServer"
  }
}
