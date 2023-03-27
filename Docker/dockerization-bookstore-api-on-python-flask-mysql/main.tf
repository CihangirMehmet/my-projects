terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.60.0"
    }
  }
}

provider "aws" {
  region =  "us-east-1"
}

data "aws_ami" "ec2" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-5.10-hvm-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["137112412989"] # Canonical
}

/*resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}*/

resource "aws_instance" "book_store" {
  ami           = data.aws_ami.ec2.id
  instance_type = "t2.micro"
  key_name = "linux-calismalar"
  security_groups = [ "docker-sec-group-203" ]

   user_data = "${file("user-data.sh")}"

  tags = {
    Name = "Web Server of Book Store"
  }
}

output "public_dns" {
    value = aws_instance.book_store.public_dns
}
/*resource "aws_ec2_instance_state" "test" {
  instance_id = aws_instance.book_store.id
  state       = "stopped"
}*/

resource "aws_security_group" "tf-docker-sec-gr-203" {
  name        = "docker-sec-group-203"
  description = "Allow TLS inbound traffic"
  tags = {
    Name = "docker-sec-gr-203"
  } 

  ingress {
    description      = "TLS from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    description      = "TLS from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }


  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

}

