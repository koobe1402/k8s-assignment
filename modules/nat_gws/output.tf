output "nat_gw_ids" {
  value = aws_nat_gateway.nat_gws.*.id
}

