resource "aws_lb" "alb" {
  name               = "alb-addressbook-02"
  load_balancer_type = "application"
  internal           = false
  ip_address_type    = "ipv4"
  security_groups = [
    "sg-0776d6ae6a0e49475"
  ]
  subnets = [
    "subnet-05cb4e8fc350c6faf", "subnet-0bde9310eb322a5e1", "subnet-0be6a503ff85cdc10"
  ]
  enable_deletion_protection = false
}

resource "aws_lb_listener" "lb_listener" {
  load_balancer_arn = aws_lb.alb.arn
  port              = 80
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.addressbook.arn
  }
}
