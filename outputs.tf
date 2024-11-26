output "vpc_id" {
  description = "The ID of the VPC."
  value       = aws_vpc.prod_vpc.id
}

output "public_subnet_ids" {
  description = "The IDs of the public subnets."
  value       = [aws_subnet.prod_pub_sub1.id, aws_subnet.prod_pub_sub2.id]
}

output "private_subnet_ids" {
  description = "The IDs of the private subnets."
  value       = [aws_subnet.prod_priv_sub1.id, aws_subnet.prod_priv_sub2.id]
}

output "internet_gateway_id" {
  description = "The ID of the Internet Gateway."
  value       = aws_internet_gateway.prod_igw.id
}

output "nat_gateway_id" {
  description = "The ID of the NAT Gateway."
  value       = aws_nat_gateway.prod_nat.id
}

output "public_route_table_id" {
  description = "The ID of the public route table."
  value       = aws_route_table.prod_pub_rt.id
}

output "private_route_table_id" {
  description = "The ID of the private route table."
  value       = aws_route_table.prod_priv_rt.id
}
