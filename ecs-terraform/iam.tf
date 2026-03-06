# This tells Terraform to bring the existing user into your code
import {
  to = aws_iam_user.github_actions
  id = "github-actions-deployer"
}

# You still need the resource block to define the user
resource "aws_iam_user" "github_actions" {
  name = "github-actions-deployer"
}
