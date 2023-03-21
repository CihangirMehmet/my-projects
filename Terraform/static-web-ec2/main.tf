terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.59.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

data "aws_ami" "ec2" {
  most_recent = true

  filter {
    name   = "name"
    values = ["Amazon Linux 2023 AMI*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["amazon"] # Canonical
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.ec2.id
  instance_type = "t2.micro"
  key_name = "linux-calismalar"
  security_groups = [ "kittins" ]
  user_data =  file("${path.module}/user-data.sh")

  tags = {
    Name = "HelloWorld"
  }
}