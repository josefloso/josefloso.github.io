terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }
}

# Provider block this is used to connect Terraform to AWS
provider "aws" {
  region = "us-east-1"
}

# provides a random provider resource 
resource "random_id" "rand" {
  byte_length = 4
}

# S3 bucket 
resource "aws_s3_bucket" "bucket" {
  bucket = "tf-day3-bucket-${random_id.rand.hex}"

  tags = {
    Name = "day3_bucket"
  }
}

# VPC resource to create a virtual private cloud in AWS
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}
# Security group to allow HTTPS traffic
resource "aws_security_group" "sg" {
  name        = "web_server_inbound"
  description = "Allow HTTPS"
  vpc_id      = aws_vpc.main.id #this line references the created VPC without hardcoding the VPC ID

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}