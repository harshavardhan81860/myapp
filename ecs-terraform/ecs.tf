resource "aws_ecs_cluster" "main" {
  name = "myapp-cluster"
network_configuration {
  subnets = [
    aws_subnet.public1.id,
    aws_subnet.public2.id
  ]

  security_groups = [
    aws_security_group.ecs_sg.id
  ]

  assign_public_ip = true
}
}
