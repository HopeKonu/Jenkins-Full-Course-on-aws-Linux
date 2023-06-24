terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "b" {
  bucket = "mybuckethopedemo12"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}




resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "jenkins-vpc"
  }
}

resource "aws_instance" "web" {
  ami           = "ami-022e1a32d3f742bd8"
  instance_type = "t3.micro"

  tags = {
    Name = "konuhopejenkins"
  }
}

