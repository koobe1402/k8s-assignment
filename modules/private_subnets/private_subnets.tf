resource "aws_subnet" "private_subnets" {
  count = length(var.aws_availability_zones)

  vpc_id            = var.vpc_id
  availability_zone = element(var.aws_availability_zones, count.index)
  cidr_block        = element(var.private_subnet_cidrs, count.index)

  tags =  {
    Name        = "private_subnet_${replace(element(var.aws_availability_zones, count.index), "-", "_")}"
    Project     = var.project
    Subnet_type = "private"
  }
}

resource "aws_route_table" "private" {
  count = length(var.aws_availability_zones)

  vpc_id = var.vpc_id

  tags = {
    Name       = "private_route_${replace(element(var.aws_availability_zones, count.index), "-", "_")}"
    Project    = var.project
    Route_type = "private"
  }
}

resource "aws_route" "private_to_nat_gateway" {
  count = length(var.aws_availability_zones)

  route_table_id         = element(aws_route_table.private.*.id, count.index)
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = element(var.nat_gw_ids, count.index)
}

resource "aws_route_table_association" "private" {
  count = length(var.aws_availability_zones)

  subnet_id      = element(aws_subnet.private_subnets.*.id, count.index)
  route_table_id = element(aws_route_table.private.*.id, count.index)
}

