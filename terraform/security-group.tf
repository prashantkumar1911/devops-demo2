resource "aws_security_group" "devops-demo2-sg" {
  name        = "devops-demo2-sg"
  description = "Devops Demo Security Group"

  tags = {
    Name = "devops-demo2-sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
  security_group_id = aws_security_group.devops-demo2-sg.id
  cidr_ipv4         = local.my_ip
  from_port         = 22
  to_port           = 22
  ip_protocol       = "tcp"
}

resource "aws_vpc_security_group_ingress_rule" "allow_tomcat" {
  security_group_id = aws_security_group.devops-demo2-sg.id

  cidr_ipv4   = local.my_ip
  from_port   = 8080
  to_port     = 8080
  ip_protocol = "tcp"
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.devops-demo2-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

locals {
  my_ip = "${chomp(data.http.my-ip.response_body)}/32"
}