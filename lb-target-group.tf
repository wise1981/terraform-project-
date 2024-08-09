resource "aws_lb_target_group" "genius-target" {
  name            = "genius-target"
  target_type     = "instance"
  port            = 80
  protocol        = "HTTP"
  ip_address_type = "ipv4"
  vpc_id          = aws_vpc.genius-vpc.id
  depends_on      = [aws_lb.genius-lb]

  health_check {
    enabled             = true
    interval            = 60
    timeout             = 30
    healthy_threshold   = 3
    unhealthy_threshold = 3
    path                = "/healthcheck"
    matcher             = "200-299"
  }
}