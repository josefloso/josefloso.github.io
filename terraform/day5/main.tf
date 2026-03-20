provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "example" {
  bucket = "tf-state-day5-bucket-12345"

  tags = {
    Name = "day5-bucket"
  }
}