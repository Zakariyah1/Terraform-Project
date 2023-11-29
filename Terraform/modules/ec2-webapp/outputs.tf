output "public_ip" {
  description = "The public IP of the web app"
  value       = aws_instance.EC2-WebApp.public_ip
}

output "security_groups" {
  description = "The secuirty group of the web app"
  value = aws_instance.EC2-WebApp.security_groups
}

output "VPC" {
  description = "value"
  value = aws_instance.EC2-WebApp.vpc_security_group_ids
}
