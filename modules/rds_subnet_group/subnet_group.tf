resource "aws_db_subnet_group" "subnet_group" {
  description = "${var.project} subnet group"
  name_prefix = "${var.project}_"
  subnet_ids  =  var.private_subnets_ids

  tags = {
      Project = var.project
  }
}

