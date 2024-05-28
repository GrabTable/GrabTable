resource "aws_lb_target_group" "terraform_target_group" {
  name     = "terraform-target-group"
  protocol = "TCP"
  port     = 8000
  vpc_id   = aws_vpc.default.id

  health_check {
    path    = "/actuator/health"
    matcher = "200-300"
  }
}

resource "aws_lb_listener" "terraform_lb_listener" {
  load_balancer_arn = aws_lb.terraform_lb.arn
  port              = "80"
  protocol          = "TCP"
  default_action {
    type = "forward"
    forward {
      target_group {
        arn    = aws_lb_target_group.terraform_target_group.arn
        weight = 0
      }
    }
  }
}

resource "aws_lb" "terraform_lb" {
  name               = "terraform-lb"
  load_balancer_type = "network"
  subnets = [
    aws_subnet.public_subnet_1.id,
    aws_subnet.public_subnet_2.id
  ]
  security_groups = [aws_security_group.launch_wizard_1.id]
}