# This tells Terraform to bring the existing user into your code
import {
  to = aws_iam_user.github_actions
  id = "github-actions-deployer"
}

# You still need the resource block to define the user
resource "aws_iam_user" "github_actions" {
  name = "github-actions-deployer"
}
# 1. Create the IAM Role
resource "aws_iam_role" "ecs_task_execution_role" {
  name = "myapp-ecs-task-execution-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ecs-tasks.amazonaws.com"
        }
      }
    ]
  })
}

# 2. Attach the Amazon-provided policy for ECR and CloudWatch access
resource "aws_iam_role_policy_attachment" "ecs_task_execution_role_policy" {
  role       = aws_iam_role.ecs_task_execution_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}
