output "private_subnets_ids" {
  value = aws_subnet.private_subnets.*.id
}

