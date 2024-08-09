resource "aws_launch_template" "genius-lt" {
  name = "genius-lt"
  image_id = var.amazon_machine_image
  instance_type = var.instance_type
  #key_name = aws_key_pair.genius-keys_name
  
  network_interfaces {
    associate_public_ip_address = true 
    security_groups = [aws_security_group.ASC-SG.id]
  }

  block_device_mappings {
    device_name = "/dev/sdf"

    ebs {
      volume_size = 8
      volume_type = "gp3"
    }
  }

  update_default_version = true 
  user_data = filebase64("aparche.sh")

tag_specifications {
    resource_type = "instance"
    tags = {
      name = "genius-lt"
    }
}
}