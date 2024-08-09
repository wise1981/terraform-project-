resource "aws_autoscaling_group" "genius-asg" {
  name                      = "genius-asg"
  max_size                  = 4
  min_size                  = 2
  health_check_grace_period = 300
  health_check_type         = "EC2"
  default_cooldown = 30
  desired_capacity          = 3
  force_delete              = true
  vpc_zone_identifier       = [aws_subnet.genius-public-subnet1.id, aws_subnet.genius-public-subnet2.id]
  
  launch_template {
    id = aws_launch_template.genius-lt.id
    version = "1"     # Specific numeric version that exists
  }

  tag {
    key = "Key"
    value = "Value"
    propagate_at_launch = true
  }

}