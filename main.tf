provider "aws" {
  region = var.aws_region
}

resource "aws_vpc" "main" {
  cidr_block       = "172.16.0.0/16"
  instance_tenancy = "default"
  
  tags = {
    Name = "main"
  }
}

# Declare security group name variable
variable "security_group" {
  description = "Name of the security group"
  default     = "jenkins-sg"
}

resource "aws_security_group" "jenkins-sg-2022" {
  name        = var.security_group
  description = "security group for EC2 instance"

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.security_group
  }
}

resource "aws_instance" "myFirstInstance" {
  ami                    = var.ami_id
  key_name               = var.key_name
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.jenkins-sg-2022.id]

  tags = {
    Name = var.tag_name
  }
}

resource "aws_eip" "myFirstInstance" {
  instance = aws_instance.myFirstInstance.id
  domain   = "vpc"

  tags = {
    Name = "my_elastic_ip"
  }
}
