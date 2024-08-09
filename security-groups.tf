


#security group for presentation tier ec2
resource "aws_security_group" "genius-sg" {
  name        = "genius-sg"
  description = "Security group for ec2 instance"
  vpc_id      = aws_vpc.genius-vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    description = "http"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    description = "ssh"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }
  tags = {
    Name = "genius-sg"
  }
}


#LOAD BALANCER SECURITY GROUP
resource "aws_security_group" "lb-sg" {
  name        = "lb-sg"
  description = "security group for load balancer"
  vpc_id      = aws_vpc.genius-vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    description = "http"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    name = "lb_sg"
  }

}

#SECURITY GROUP FOR AUTO SCALLING 
resource "aws_security_group" "ASC-SG" {
  name        = "ASC-SC"
  description = "Security group for auto scalling launch template"
  vpc_id      = aws_vpc.genius-vpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    description = "http"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    description = "ssh"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }
  tags = {
    Name = "genius-lt"
  }
}

#create rds security group 
resource "aws_security_group" "rds-security-group" {
  name = "rds-security-group"
  description = "Allow inbound traffic on port 3306 for RDS"
  vpc_id = aws_vpc.genius-vpc.id

  ingress {
    from_port = 3306
    to_port = 3306
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  

  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "RDS Security Group"
  }
  
}



