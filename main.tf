terraform {

  cloud {
    organization = "terraform-77"

    workspaces {
      name = "dev"
      //   tags = [ "my_first_workspace" ]
    }
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }


  required_version = "~>1.8.0"
}

# Configure the AWS Provider
provider "aws" {
  //profile = "ammar"
  region = "us-east-1"
}

resource "aws_instance" "example" {
  ami           = "ami-0d94353f7bad10668" # Example AMI ID
  instance_type = "t2.micro"

  vpc_security_group_ids = [module.Security_Groups.SG_var]

  tags = {
    Name = "example-instance"
  }
}


module "Security_Groups" {
  source = "./Security_Group"

}