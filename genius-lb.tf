# LOAD BALANCER 
resource "aws_lb" "genius-lb" {
  name               = "genius-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.lb-sg.id]
  subnets            = [aws_subnet.genius-public-subnet1.id, aws_subnet.genius-public-subnet2.id]

}

