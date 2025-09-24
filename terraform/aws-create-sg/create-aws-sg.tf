provider "aws" {
  region = "us-east-1"  # Change to your preferred region
}

resource "aws_security_group" "new_sg" {
  name        = "terraform-security-group"
  description = "Create Security using Terraform"
  vpc_id      = "vpc-0a29d4ea8ef4888da"  # Replace with your VPC ID

  ingress {
    description      = "Allow SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    description      = "Allow HTTP"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    description      = "Allow all outbound traffic"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "terraform-security-group"
  }
}