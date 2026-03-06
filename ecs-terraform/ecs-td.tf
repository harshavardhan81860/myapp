resource "aws_ecs_task_definition" "app" {
  family                   = "webapp-task"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = "256"
  memory                   = "512"

  container_definitions = jsonencode([
    {
      name  = "webapp"
      image = "${aws_ecr_repository.app_repo.repository_url}:latest"
      portMappings = [
        {
          containerPort = 80
        }
      ]
    }
  ])
}
