module "vpc" {
  source   = "../../modules/vpc"
  vpc_cidr = "${var.vpc_cidr}"
  project  = "${var.project}"
}

module "public_subnets" {
  source = "../../modules/public_subnets"

  vpc_id                 = "${module.vpc.vpc_id}"
  igw_id                 = "${module.vpc.igw_id}"
  public_subnet_cidrs    = "${var.public_subnet_cidrs}"
  aws_availability_zones = "${var.aws_availability_zones}"

  project = "${var.project}"
}

module "nat_gws" {
  source = "../../modules/nat_gws"

  public_subnets_ids     = "${module.public_subnets.public_subnets_ids}"
  aws_availability_zones = "${var.aws_availability_zones}"

  project = "${var.project}"
}

module "private_subnets" {
  source = "../../modules/private_subnets"

  vpc_id                 = "${module.vpc.vpc_id}"
  nat_gw_ids             = "${module.nat_gws.nat_gw_ids}"
  private_subnet_cidrs   = "${var.private_subnet_cidrs}"
  aws_availability_zones = "${var.aws_availability_zones}"

  project = "${var.project}"
}

