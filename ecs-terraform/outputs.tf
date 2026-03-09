output "alb_dns" {
  value = aws_lb.alb.dns_name
}

# Fix for ECR Repo URL Output
# (Ensure your ECR resource in ecr.tf is named "app_repo")
output "ecr_repo_url" {
  description = "The URL of the ECR repository"
  value       = aws_ecr_repository.app_repo.repository_url
}
