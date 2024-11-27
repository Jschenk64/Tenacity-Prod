resource "aws_vpc" "prod_vpc" {
  cidr_block            = "10.49.0.0/16"
  instance_tenancy      = "default"
  enable_dns_hostnames  = true
  enable_dns_support    = true

  tags = {
    Name = "Prod-VPC"
  }
}

resource "aws_subnet" "prod_pub_sub1" {
  vpc_id            = aws_vpc.prod_vpc.id
  cidr_block        = "10.49.150.0/24"
  availability_zone = "eu-west-2a"

  tags = {
    Name = "Prod-Pub1"
  }
}

resource "aws_subnet" "prod_pub_sub2" {
  vpc_id            = aws_vpc.prod_vpc.id
  cidr_block        = "10.49.151.0/24"
  availability_zone = "eu-west-2b"

  tags = {
    Name = "Prod-Pub2"
  }
}

resource "aws_subnet" "prod_priv_sub1" {
  vpc_id            = aws_vpc.prod_vpc.id
  cidr_block        = "10.49.152.0/24"
  availability_zone = "eu-west-2a"

  tags = {
    Name = "Prod-Priv1"
  }
}

resource "aws_subnet" "prod_priv_sub2" {
  vpc_id            = aws_vpc.prod_vpc.id
  cidr_block        = "10.49.153.0/24"
  availability_zone = "eu-west-2b"

  tags = {
    Name = "Prod-Priv2"
  }
}

resource "aws_internet_gateway" "prod_igw" {
  vpc_id = aws_vpc.prod_vpc.id

  tags = {
    Name = "Prod-IGW"
  }
}

resource "aws_eip" "prod_eip" {
  tags = {
    Name = "Prod-Eip"
  }
}
module "Staging" {
  source                = "./modules/vpc_module"
  vpc_cidr              = "10.49.0.0/16"
  public_subnet_cidrs   = ["10.49.10.0/24", "10.49.11.0/24"]
  private_subnet_cidrs  = ["10.49.12.0/24", "10.49.13.0/24"]
  availability_zones    = ["eu-west-2a", "eu-west-2b"]
  tags                  = {
    Env = "Stag"
    Name ="VPC02"
  }
}
