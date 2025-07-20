resource "aws_ecs_service" "addressbook" {
  name            = "td-addressbook-service-pxk3j7k7c"
  cluster         = "walter-white"
  task_definition = var.taskdef_arn
  launch_type     = "FARGATE"
  desired_count   = 1
  platform_version = "LATEST"
  scheduling_strategy = "REPLICA"
  enable_ecs_managed_tags = true
  propagate_tags          = "NONE"
  deployment_controller {
    type = "ECS"
  }

  network_configuration {
    subnets         = [
      "subnet-05cb4e8fc350c6faf",
      "subnet-0bde9310eb322a5e1",
      "subnet-0be6a503ff85cdc10"
    ]
    security_groups = ["sg-0776d6ae6a0e49475"]
    assign_public_ip = true
  }

  load_balancer {
    target_group_arn = var.target_group_arn
    container_name   = "addressbook"
    container_port   = 8080
  }

  deployment_circuit_breaker {
    enable   = true
    rollback = true
  }

  lifecycle {
    ignore_changes = [
      desired_count
    ]
  }
}