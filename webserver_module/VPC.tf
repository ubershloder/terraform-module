data "aws_availability_zones" "available" {
  state = "available"
}
resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  instance_tenancy     = var.instance_tenancy
  enable_dns_hostnames = var.dns_hostnames
  enable_dns_support   = var.dns_support

  tags = {
    Name = "MyVPC"
  }
}
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "IGW for VPC"
  }
}

resource "aws_subnet" "first_sub" {
  vpc_id               = aws_vpc.main.id
  cidr_block           = var.first_subnet_cidr
  availability_zone_id = data.aws_availability_zones.available.names[1]
  #rewrite
  tags = {
    Name = "1st subnet"
  }
}

resource "aws_subnet" "second_sub" {
  vpc_id               = aws_vpc.main.id
  cidr_block           = var.second_subnet_cidr
  availability_zone_id = data.aws_availability_zones.available.names[2]

  tags = {
    Name = "2nd subnet"

  }
}

resource "aws_route_table" "route_table" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = var.route_cidr
    gateway_id = aws_internet_gateway.igw.id
  }
}
