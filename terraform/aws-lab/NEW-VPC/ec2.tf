resource "aws_security_group" "web" {
  name        = "flask-sg"
  description = "Allow SSH and HTTP"
  vpc_id      = aws_vpc.datacenter_vpc.id

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

  tags = {
    Name = "flask-sg"
  }
}


resource "aws_instance" "flask" {
  ami                    = "ami-068c0051b15cdb816" 
  instance_type          = "t3.micro"
  subnet_id              = aws_subnet.dc_public1_az1.id   
  vpc_security_group_ids = [aws_security_group.web.id]
  associate_public_ip_address = true
  key_name                = "my-lab-kp"
#  iam_instance_profile   = aws_iam_instance_profile.ssm_profile.name

  user_data = <<-EOF
    #!/bin/bash
    yum update -y
    yum install -y python3 pip
    pip3 install flask

    cat << 'APP' > /home/ec2-user/app.py
    from flask import Flask
    app = Flask(__name__)

    @app.route("/")
    def hello():
        return "Hello Zakki from Flask on EC2!"

    app.run(host="0.0.0.0", port=80)
    APP

    python3 /home/ec2-user/app.py &
  EOF

  tags = {
    Name = "flask-ec2"
  }
}
