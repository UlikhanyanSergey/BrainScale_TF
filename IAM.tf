#IAM policy for ECR
resource "aws_iam_policy" "ecr_access" {
  name        = "ECRAccessPolicy"
  description = "Access to Amazon ECR"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = "ecr:*"
        Resource = "*"
      },
    ]
  })
}


resource "aws_iam_instance_profile" "ecr_full_access_profile" {
  name = "ECRFullAccessInstanceProfile"
  role = aws_iam_role.ecr_full_access.name
}



#IAM role for ECR
  resource "aws_iam_role" "ecr_full_access" {
  name = "ECRFullAccessRole"
  
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "ecr_full_access_policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryFullAccess"
  role       = aws_iam_role.ecr_full_access.name
}