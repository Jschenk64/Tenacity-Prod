provider "aws" {
  region = "eu-central-1"
}

module "HR-Services" {
  source                 = "./modules/vpc_module"
  vpc_cidr               = "10.49.0.0/16"
  public_subnet_cidrs    = ["10.49.10.0/24", "10.49.20.0/24"]
  private_subnet_cidrs   = ["10.49.30.0/24", "10.49.40.0/24"]
  availability_zones     = ["eu-central-1a", "eu-central-1b"]
  key_name               = "mse-svh105"
  vpc_name               = "HR-VPC"
  public_instance_names  = ["BIE-SVWEB105", "BIE-SVWEB106"]
  private_instance_names = ["BIE-SVAPP107", "BIE-SVAPP108"]

  tags = {
    Environment = "HR"

  }
}