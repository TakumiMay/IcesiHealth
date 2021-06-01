variable "aws_region" {
  type    = string
  default = "us-east-2"
}

variable "automation_vpc_id" {
  type    = string
  default = "vpc-00537cce805fc40d5"
}

variable "public_subnet_id_2a" {
  type    = string
  default = "subnet-0578b7c357c451a05"
}

variable "private_subnet_id_2a" {
  type    = string
  default = "subnet-072e50c4bdd28c0fc"
}

variable "private_subnet_id_2c" {
  type    = string
  default = "subnet-0a6d0cefe43198a73"
}


##aquí son cosas que no tengo idea. 
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