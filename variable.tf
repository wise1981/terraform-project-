 variable "region" {
    description = "vpc region"
    type = string   
    default = "eu-west-2"
 }

 variable "vpc_cidr" {
    description = "vpc cidr block"
    type = string   
    default = "10.0.0.0/16"
 }

variable "private_sub_1_cidr" {
    description = "private subnet cidr block"
    type = string   
    default = "10.0.1.0/24"
 }

variable "private_sub_2_cidr" {
    description = "private subnet cidr block"
    type = string   
    default = "10.0.2.0/24"
 }

 variable "public_sub_1_cidr" {
    description = "public subnet cidr block"
    type = string   
    default = "10.0.3.0/24"
 }

 variable "public_sub_2_cidr" {
    description = "public subnet cidr block"
    type = string   
    default = "10.0.4.0/24"
 }

 variable "ami" {
    description = "ec2 Amazon machine image"
    type = string   
    default = "ami-07c1b39b7b3d2525d"
 }

 variable "instance_type" {
    description = "ec2 instance type"
    type = string   
    default = "t2.micro"
 }

variable "amazon_machine_image" {
    description = "lt machine image"
    type = string   
    default = "ami-02b6c3b7e67e2c9d6"
 }












