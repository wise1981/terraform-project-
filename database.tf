resource "aws_db_subnet_group" "genius-db" {
  name       = "genius.db"
  subnet_ids = [aws_subnet.genius-private-subnet1.id, aws_subnet.genius-private-subnet2.id]

  tags = {
    Name = "genius.db"
  }
}

#CREATE RDS DATABASE
resource "aws_db_instance" "genius-rds" {
  allocated_storage    = 10
  db_name              = "mydb"
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  username             = "admin"
  password             = "terraform123"
  parameter_group_name = "default.mysql8.0"
  skip_final_snapshot  = true
  availability_zone = "eu-west-2a"
  db_subnet_group_name = aws_db_subnet_group.genius-db.name
  vpc_security_group_ids = [aws_security_group.rds-security-group.id]

  tags = {
    name = "genius-rds"
  }
}
