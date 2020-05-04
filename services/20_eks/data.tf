data "terraform_remote_state" "network" {
  backend = "s3"

  config = {
    bucket = "state-637999332513"
    region = "eu-west-1"
    key    = "network.terraform_state"
  }
}

