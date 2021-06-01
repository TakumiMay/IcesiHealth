variable "aws_region" {
  type    = string
  default = "us-east-2" 
}

variable "automation_vpc_id" {
  type    = string
  default = "vpc-025ce59ecf7aed804"
}

variable "public_subnet_id_2c" {
  type    = string
  default = "subnet-0c4d638d6183bde99"
}

variable "public_subnet_id_2a" {
  type    = string
  default = "subnet-02018063ae6cb01aa"
}

variable "ami_id" {
  type    = string
  default = "ami-08962a4068733a2b6"
}

variable "key_name" {
  type    = string
  default = "rootAutomatizacion"
}

variable "tag_responsible" {
  type    = string
  default = "rootAutomatizacion"
}