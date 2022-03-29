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

resource "aws_instance" "nginx" {
  ami = 
  instance_type = "t2.micro"
  key_name = "nginx"
}

data "template_file" "install_nginx" {
  template = file("./install.sh")
}

resource "aws_instance" "nginx" {
  ami           = "ami-0dcc0ebde7b2e00db"
  instance_type = "t2.micro"
  user_data = data.template_file.install_nginx.rendered
}
