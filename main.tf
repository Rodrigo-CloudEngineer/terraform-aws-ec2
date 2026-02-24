provider "aws" {
  region = "us-east-1"
}

resource "aws_security_group" "web_sg" {
  name        = "allow_web_traffic_rodrigo"
  description = "Permitir SSH e HTTP"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "web_server" {
  ami           = "ami-04b4f1a9cf54c11d0"
  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.web_sg.id]

  tags = {
    Name = "Servidor-Terraform-Rodrigo"
  }
}

