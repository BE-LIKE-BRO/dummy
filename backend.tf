terraform {
  backend "s3" {
    bucket = "blb-main-bucket"
    key    = "blb.tfstate"
    region = "us-east-1"
  }
}
