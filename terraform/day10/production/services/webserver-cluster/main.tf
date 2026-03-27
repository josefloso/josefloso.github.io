terraform {
  backend "s3" {
    bucket         = "lydiah-terraform-state-bucket"
    key            = "day10/production/services/webserver-cluster/terraform.tfstate"
    region         = "eu-central-1"
    dynamodb_table = "terraform-state-locks"
    encrypt        = true
  }
}

provider "aws" {
  region = "eu-central-1"
}

module "webserver_cluster" {
  source = "github.com/josefloso/terraform-aws-webserver-cluster?ref=v0.0.1"

  cluster_name  = "webservers-production"
  instance_type = "t2.medium"
  min_size      = 4
  max_size      = 10
  server_port   = 80
}

