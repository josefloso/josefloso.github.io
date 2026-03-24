terraform {
  required_version = ">= 1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket         = "josef-terraform-state-bucket-2026"
    key            = "state-day7/terraform.tfstate"
    region         = "eu-west-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}

resource "aws_s3_bucket" "example" {
  bucket = "${var.project_name}-state-demo-bucket"

  tags = {
    Name        = "State Demo Bucket"
    Environment = var.environment
  }
}