terraform {
  backend "s3" {
    bucket  = "state-637999332513"
    region  = "eu-west-1"
    key     = "eks.terraform_state"
    encrypt = "true"
  }
}

