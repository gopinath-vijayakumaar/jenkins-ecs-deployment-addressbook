resource "aws_dynamodb_table" "terraform_locks" {
  name         = "terraform-locking"
  hash_key     = "LockID"
  billing_mode = "PAY_PER_REQUEST"


  attribute {
    name = "LockID"
    type = "S"
  }
}

module "aws_ecs_cluster" {
  source = "../modules/aws_ecs"
}

module "aws_ecs_task_definition" {
  source = "../modules/ecs_task_definitions"
  family = var.family
  network_mode = var.network_mode
  requires_compatibilities = var.requires_compatibilities
}

module "aws_alb" {
  source = "../modules/aws_alb"
}

module "aws_lb_target_group" {
  source = "../modules/aws_lb_target_group"
}

module "aws_ecs_service" {
  source = "../modules/aws_ecs_cluster_service"
}
