output "public_ip" {
  value = aws_instance.devops_demo2.public_ip
}

output "public_dns" {
  value = aws_instance.devops_demo2.public_dns
}