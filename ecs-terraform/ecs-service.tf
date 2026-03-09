resource "aws_ecs_service" "app" {
  name            = "myapp-task-service"
  cluster         = aws_ecs_cluster.main.id
  task_definition = aws_ecs_task_definition.app.arn
  launch_type     = "FARGATE"
  desired_count   = 1

network_configuration {
  subnets          = aws_subnet.public[*].id
  assign_public_ip = true 
  security_groups  = [aws_security_group.ecs_tasks.id]
}

  load_balancer {
    target_group_arn = aws_lb_target_group.app_tg.arn
    container_name   = "myapp"
    container_port   = 80
  }
}
