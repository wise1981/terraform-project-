resource "aws_instance" "genius-ec2" {
  ami                    = var.ami
  instance_type          = var.instance_type
  subnet_id              = aws_subnet.genius-public-subnet1.id
  vpc_security_group_ids = [aws_security_group.genius-sg.id]
  #security_groups             = [aws_security_group.genius-ec2-sg.name]
  associate_public_ip_address = true
  #key name = aws_key_pair.genius-keys_name
  user_data                   = filebase64("aparche.sh")


  root_block_device {
    volume_size           = 8
    volume_type           = "gp3"
    delete_on_termination = true
  }

  tags = {
    Name = "genius-ec2"
  }
}