resource "aws_instance" "jenkins_server" {
  ami           = "ami-0567e0d2b4b2169ae" # us-west-2
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.jenkins.id]
  key_name = "sahil_win_ssh_keys"
}

resource "aws_security_group" "jenkins" {
  name        = "jenkins_sg"
  description = "jenkins server security group"
  vpc_id      = "vpc-fa6cad91"

  ingress {
    description      = "ssh"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  ingress {
    description      = "web"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}