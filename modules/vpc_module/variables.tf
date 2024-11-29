variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
}

variable "vpc_name" {
  description = "The name to assign to the VPC"
  type        = string
}

variable "public_subnet_cidrs" {
  description = "A list of CIDR blocks for the public subnets"
  type        = list(string)
}

variable "private_subnet_cidrs" {
  description = "A list of CIDR blocks for the private subnets"
  type        = list(string)
}

variable "availability_zones" {
  description = "A list of availability zones to deploy subnets in"
  type        = list(string)
}

variable "tags" {
  description = "A map of tags to assign to resources"
  type        = map(string)
  default     = {}
}

variable "public_instance_names" {
  description = "List of names for the public instances"
  type        = list(string)
}

variable "private_instance_names" {
  description = "List of names for the private instances"
  type        = list(string)
}

variable "key_name" {
  description = "The name of the key pair to use for SSH access to the instances"
  type        = string
}