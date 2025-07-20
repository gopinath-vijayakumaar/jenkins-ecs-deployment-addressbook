resource "aws_lb_target_group" "addressbook" {
  name        = "tg-addressbook-01"
  port        = 80
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = "vpc-09753aa1a78d78868"

  health_check {
    protocol            = "HTTP"
    port                = "traffic-port"
    path                = "/"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 5
    unhealthy_threshold = 2
    matcher             = "200"
  }

  ip_address_type = "ipv4"

  
}
