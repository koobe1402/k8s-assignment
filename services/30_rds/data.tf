data "terraform_remote_state" "network" {
  backend = "s3"

  config = {
    bucket = "state-637999332513"
    region = "eu-west-1"
    key    = "network.terraform_state"
  }
}

data "terraform_remote_state" "eks_worker" {
  backend = "s3"

  config = {
    bucket = "state-637999332513"
    region = "eu-west-1"
    key    = "eks.terraform_state"
  }
}

resource "random_password" "postgres_password" {
  length = 16
  special = true
  override_special = "_%@"
}


resource "aws_ssm_parameter" "postgres_password" {
  name  = "rds-postgres"
  type  = "SecureString"
  value = random_password.postgres_password.result
}

