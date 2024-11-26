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

resource "aws_nat_gateway" "prod_nat" {
  allocation_id = aws_eip.prod_eip.id
  subnet_id     = aws_subnet.prod_priv_sub1.id

  tags = {
    Name = "Prod-NAT"
  }
}

resource "aws_route_table" "prod_pub_rt" {
  vpc_id = aws_vpc.prod_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.prod_igw.id
  }

  tags = {
    Name = "Prod-Pub-RT"
  }
}

resource "aws_route_table" "prod_priv_rt" {
  vpc_id = aws_vpc.prod_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.prod_nat.id
  }

  tags = {
    Name = "Prod-Priv-RT"
  }
}

resource "aws_route_table_association" "prod_pub1_asso" {
  subnet_id      = aws_subnet.prod_pub_sub1.id
  route_table_id = aws_route_table.prod_pub_rt.id
}

resource "aws_route_table_association" "prod_pub2_asso" {
  subnet_id      = aws_subnet.prod_pub_sub2.id
  route_table_id = aws_route_table.prod_pub_rt.id
}

resource "aws_route_table_association" "prod_priv1_asso" {
  subnet_id      = aws_subnet.prod_priv_sub1.id
  route_table_id = aws_route_table.prod_priv_rt.id
}

resource "aws_route_table_association" "prod_priv2_asso" {
  subnet_id      = aws_subnet.prod_priv_sub2.id
  route_table_id = aws_route_table.prod_priv_rt.id
}