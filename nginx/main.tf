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

data "template_file" "install" {
  template = file("./install.sh")
}

resource "aws_instance" "nginx" {
  ami           = "ami-0dcc0ebde7b2e00db"
  instance_type = "t2.micro"
  user_data = data.template_file.install.rendered
}

resource "aws_db_instance" "default" {
  allocated_storage    = 15
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  name                 = "myrds"
  username             = "name"
  password             = "password"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
}