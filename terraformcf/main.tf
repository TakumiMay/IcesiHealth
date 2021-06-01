##############
## Provider ##
##############
terraform {
  required_providers {
    aws = {
      source = "aws"
      version = "3.23.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

############################
## Data source to get VPC ##
############################

data "aws_vpc" "automation-vpc" {
  id = var.automation_vpc_id
}

#######################################
## Data source to get Public Subnets ##
#######################################

data "aws_subnet" "public-subnet-2c" {
  id = var.public_subnet_id_2c
}

data "aws_subnet" "public-subnet-2a" {
  id = var.public_subnet_id_2a
}

