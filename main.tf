#create VPC 
resource "aws_vpc" "genius-vpc" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"

  tags = {
    Name = "genius-vpc"
  }

}

#INTERNET GATEWAY
resource "aws_internet_gateway" "genius-igw" {
  vpc_id = aws_vpc.genius-vpc.id

  tags = {
    Name = "genius-igw"
  }
}


#private-subnet-1
resource "aws_subnet" "genius-private-subnet1" {
  vpc_id            = aws_vpc.genius-vpc.id
  cidr_block        = var.private_sub_1_cidr
  availability_zone = "eu-west-2a"

  tags = {
    Name = "genius-private-subnet1"
  }
}

#private-subnet-2
resource "aws_subnet" "genius-private-subnet2" {
  vpc_id            = aws_vpc.genius-vpc.id
  cidr_block        = var.private_sub_2_cidr
  availability_zone = "eu-west-2b"

  tags = {
    Name = "genius-private-subnet2"
  }
}

#public-subnet-1
resource "aws_subnet" "genius-public-subnet1" {
  vpc_id            = aws_vpc.genius-vpc.id
  cidr_block        = var.public_sub_1_cidr
  availability_zone = "eu-west-2a"

  tags = {
    Name = "genius-public-subnet1"
  }
}

#public-subnet-2
resource "aws_subnet" "genius-public-subnet2" {
  vpc_id            = aws_vpc.genius-vpc.id
  cidr_block        = var.public_sub_2_cidr
  availability_zone = "eu-west-2b"

  tags = {
    Name = "genius-public-subnet2"
  }
}


#public route table 
resource "aws_route_table" "genius-public-route-table" {
  vpc_id = aws_vpc.genius-vpc.id

  tags = {
    Name = "genius-public-route-table"
  }
}

#private route table 
resource "aws_route_table" "genius-private-route-table" {
  vpc_id = aws_vpc.genius-vpc.id

  tags = {
    Name = "genius-private-route-table"
  }
}

#public subnet association 1
resource "aws_route_table_association" "genius-public-sub-association1" {
  subnet_id      = aws_subnet.genius-public-subnet1.id
  route_table_id = aws_route_table.genius-public-route-table.id
}

#public subnet association 2
resource "aws_route_table_association" "genius-public-sub-association2" {
  subnet_id      = aws_subnet.genius-public-subnet2.id
  route_table_id = aws_route_table.genius-public-route-table.id
}

#private subnet association 1
resource "aws_route_table_association" "genius-private-sub-association1" {
  subnet_id      = aws_subnet.genius-private-subnet1.id
  route_table_id = aws_route_table.genius-private-route-table.id
}

#private subnet association 2
resource "aws_route_table_association" "genius-private-sub-association2" {
  subnet_id      = aws_subnet.genius-private-subnet2.id
  route_table_id = aws_route_table.genius-private-route-table.id
}



 