provider "aws" {
  region = "eu-central-1"
}

module "HR-vpc" {
  source                = "./modules/vpc_module"
  vpc_cidr              = "10.49.0.0/16"
  public_subnet_cidrs   = ["10.49.150.0/24", "10.49.151.0/24"]
  private_subnet_cidrs  = ["10.49.152.0/24", "10.49.153.0/24"]
  availability_zones    = ["eu-central-1a", "eu-central-1b"]
  tags                  = {
    Env = "Prod"
    Name = "HR-VPC"
  }
}

module "Dev-vpc" {
  source                = "./modules/vpc_module"
  vpc_cidr              = "10.49.0.0/16"
  public_subnet_cidrs   = ["10.49.55.0/24", "10.49.56.0/24"]
  private_subnet_cidrs  = ["10.49.57.0/24", "10.49.58.0/24"]
  availability_zones    = ["eu-central-1a", "eu-central-1b"]
  tags                  = {
    Env = "Prod"
    Name = "Dev-VPC"
  }
}