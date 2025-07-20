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
}

module "aws_lb_target_group" {
  source = "../modules/aws_lb_target_group"
}

module "aws_alb" {
  source           = "../modules/aws_alb"
  target_group_arn = module.aws_lb_target_group.target_group_arn
}


module "aws_ecs_service" {
  source           = "../modules/aws_ecs_cluster_service"
  taskdef_arn      = module.aws_ecs_task_definition.taskdef_arn
  target_group_arn = module.aws_lb_target_group.target_group_arn
}
