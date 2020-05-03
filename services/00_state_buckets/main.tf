resource "aws_s3_bucket" "terraform_state" {
  bucket = "state-${var.aws_account}"
  acl    = "private"

  versioning {
    enabled = true
  }

  tags = {
    Name        = "state-${var.aws_account}"
    Project     = var.project
  }
}

