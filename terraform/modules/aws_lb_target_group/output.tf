output "target_group_arn" {
    description = "The ARN of the target group"
    value       = aws_lb_target_group.addressbook.arn
}

