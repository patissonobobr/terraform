terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region = "eu-central-1"
  default_tags {
    tags = {
      Owner = "testowner"
    }
  }
}

data "aws_vpcs" "myvpcs" {}
data "aws_subnets" "subnets" {}
data "aws_security_groups" "sg" {}