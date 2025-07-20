
resource "aws_ecs_task_definition" "addressbook" {
  family                   = "td-addressbook-01"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "1024"
  memory                   = "3072"
  execution_role_arn       = "arn:aws:iam::002381039225:role/ecsTaskExecutionRole"
  task_role_arn            = "arn:aws:iam::002381039225:role/ecsTaskExecutionRole"
  runtime_platform {
    operating_system_family = "LINUX"
    cpu_architecture        = "ARM64"
  }

  container_definitions = jsonencode([
    {
      name  = "addressbook"
      image = "gopinath2029/addressbook:12"
      cpu   = 1024
      memory = 3072
      essential = true

      portMappings = [
        {
          containerPort = 8080
          hostPort      = 8080
          protocol      = "tcp"
          name          = "addressbook-8080-tcp"
          appProtocol   = "http"
        }
      ]

      logConfiguration = {
        logDriver = "awslogs"
        options = {
          awslogs-group         = "/ecs/td-addressbook"
          awslogs-region        = "ap-south-1"
          awslogs-stream-prefix = "ecs"
          awslogs-create-group  = "true"
        }
      }
    }
  ])
}
