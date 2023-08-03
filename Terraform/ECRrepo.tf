#ECR repository for Docker Image
resource "aws_ecr_repository" "ecr_repo" {
  name = "container-repo"
}

output "ECR_Repo_URI" {
  value = aws_ecr_repository.ecr_repo.repository_url
}