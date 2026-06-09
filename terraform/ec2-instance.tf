resource "aws_instance" "devops_demo2" {

  ami = "ami-04b4f1a9cf54c11d0"
  instance_type = "t3.micro"

  subnet_id = "subnet-0618f0ef4bb6b5259"

  key_name      = aws_key_pair.devops-dem2-key.key_name

  vpc_security_group_ids = [
    aws_security_group.devops-demo2-sg.id
    ]

  associate_public_ip_address = true
  monitoring    = true

  tags = {
    Name = "devops-demo2"
  }
}