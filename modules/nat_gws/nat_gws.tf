resource "aws_eip" "eip" {
  count = length(var.aws_availability_zones)
  vpc      = true

  tags = {
    Name    = "eip_${replace(element(var.aws_availability_zones, count.index), "-", "_")}"
    Project = var.project
  }
}

resource "aws_nat_gateway" "nat_gws" {
  count = length(var.aws_availability_zones)

  allocation_id = element(aws_eip.eip.*.id,count.index)
  subnet_id     = var.public_subnets_ids[count.index]

  tags  = {
    Name    = "nat_gw_${replace(element(var.aws_availability_zones, count.index), "-", "_")}"
    Project = var.project

    EIP_allocation_id = element(aws_eip.eip.*.id,count.index)
  }
}

