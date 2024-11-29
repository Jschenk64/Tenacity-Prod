output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.this.id
}

output "public_subnet_ids" {
  description = "The IDs of the public subnets"
  value       = aws_subnet.public[*].id
}

output "private_subnet_ids" {
  description = "The IDs of the private subnets"
  value       = aws_subnet.private[*].id
}

output "public_instance_ids" {
  description = "The IDs of the public EC2 instances"
  value       = aws_instance.public[*].id
}

output "private_instance_ids" {
  description = "The IDs of the private EC2 instances"
  value       = aws_instance.private[*].id
}

output "public_instance_ips" {
  description = "The public IP addresses of the public EC2 instances"
  value       = aws_instance.public[*].public_ip
}

output "private_instance_private_ips" {
  description = "The private IP addresses of the private EC2 instances"
  value       = aws_instance.private[*].private_ip
}

output "security_group_id" {
  description = "The ID of the security group allowing HTTP and SSH"
  value       = aws_security_group.allow_http_ssh.id
}