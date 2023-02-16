data "aws_availability_zones" "available" {
  state = "available"
}

resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr_block

  tags = {
    Name = "vpc_${var.env}"
  }
}

resource "aws_subnet" "public_subnet" {
  count             = length(var.public_subnet_cidrs)
  vpc_id            = aws_vpc.main.id
  cidr_block        = element(var.public_subnet_cidrs, count.index)
  availability_zone = length(var.azs) > 0 ? element(var.azs, count.index) : element(data.aws_availability_zones.available.names, count.index)

  tags = {
    Name = "public_subnet_${var.env}_${count.index + 1}"
  }
}

resource "aws_subnet" "private_subnet" {
  count             = length(var.private_subnet_cidrs)
  vpc_id            = aws_vpc.main.id
  cidr_block        = element(var.private_subnet_cidrs, count.index)
  availability_zone = length(var.azs) > 0 ? element(var.azs, count.index) : element(data.aws_availability_zones.available.names, count.index)

  tags = {
    Name = "private_subnet_${var.env}_${count.index + 1}"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "vpc_ig_${var.env}"
  }
}

resource "aws_route_table" "public_subnet_route_table" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = var.ig_cidr_block
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "public_subnet_route_table_${var.env}"
  }
}

resource "aws_route_table_association" "public_subnet_association" {
  count          = length(var.public_subnet_cidrs)
  subnet_id      = element(aws_subnet.public_subnet[*].id, count.index)
  route_table_id = aws_route_table.public_subnet_route_table.id
}

resource "aws_route_table" "private_subnet_route_table" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "private_subnet_route_table_${var.env}"
  }
}

resource "aws_route_table_association" "private_subnet_association" {
  count          = length(var.private_subnet_cidrs)
  subnet_id      = element(aws_subnet.private_subnet[*].id, count.index)
  route_table_id = aws_route_table.private_subnet_route_table.id
}