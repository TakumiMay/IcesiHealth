##############################
## Security group variables ##
##############################

#########
## SSH ##
#########

variable "front_sg_description" {
  type    = string
  default = "Security group for the front instance - Automatizacion Group3"
}

variable "front_sg_ingress_ssh_description" {
  type    = string
  default = "Allowed SSH from anywhere - Automatizacion Group3"
}

variable "front_sg_ingress_ssh_port" {
  type        = number
  default     = 22
  description = "This is the port for the inbound rule that allowed SSH to the frontend instance"
}

variable "front_sg_ingress_ssh_protocol" {
  type        = string
  default     = "tcp"
  description = "This is the protocol for the inbound rule that allowed SSH to the frontend instance"
}

variable "front_sg_ingress_ssh_cird" {
  type        = list(string)
  default     = [ "0.0.0.0/0" ]
  description = "This is the list of CIDR"
}

#########
## APP ##
#########

variable "front_sg_ingress_app_description" {
  type        = string
  default     = "Allow traffic trough port 8080 from anywhere"
  description = "This is the description for the inbound rule that allowed traffic through the port 8080 from the internet to the frontend - Automatizacion Group3"
}

variable "front_sg_ingress_app_port" {
  type        = number
  default     = 8080
  description = "This is the port for the inbound rule that allowed traffic through the port 8080 from the internet to the frontend"
}

variable "front_sg_ingress_app_protocol" {
  type        = string
  default     = "tcp"
  description = "This is the protocol for the inbound rule that allowed traffic through the port 8080 from the internet to the frontend"
}

variable "front_sg_ingress_app_cird" {
  type        = list(string)
  default     = [ "0.0.0.0/0" ]
  description = "This is the list of CIDR"
}

######################
## Egress Variables ##
######################

variable "front_sg_egress_description" {
  type    = string
  default = "Outbound rule - Automatizacion Group3"
}

variable "front_sg_egress_port" {
  type    = number
  default = 0
}

variable "front_sg_egress_protocol" {
  type    = string
  default = "-1"
}

variable "front_sg_egress_cird" {
  type        = list(string)
  default     = [ "0.0.0.0/0" ]
  description = "This is the list of CIDR"
}

############################################
## Security group Load Balancer Variables ##
############################################

variable "lb_sg_description" {
  type    = string
  default = "load balancer security group - Automatizacion Group3"
}

variable "lb_sg_in_traffic_description" {
  type        = string
  default     = "Allowed traffic from anywhere"
  description = "This is the description for the inbound rule that allowed traffic to the load balancer - Automatizacion Group3"
}

variable "lb_sg_in_traffic_port" {
  type        = number
  default     = 8080
  description = "This is the port for the inbound rule that allowed traffic to the load balancer"
}

variable "lb_sg_in_traffic_protocol" {
  type        = string
  default     = "tcp"
  description = "This is the protocol for the inbound rule that allowed traffic to the load balancer"
}

variable "lb_sg_in_traffic_cird" {
  type        = list(string)
  default     = [ "0.0.0.0/0" ]
  description = "This is the list of CIDR"
}

###############################
## Launch Template Variables ##
###############################

variable "front_launch_template_name" {
  type    = string
  default = "Group3-launch-template-front"
}

variable "front_launch_template_instance_type" {
  type    = string
  default = "t2.micro"
}

variable "front_launch_template_instance_name" {
  default = "Group3-tf-instance-front-icesi-health"
}

############################
## Target Group Variables ##
############################

variable "front_tg_target_type" {
  type    = string
  default = "instance"
}

variable "front_tg_protocol" {
  type    = string 
  default = "HTTP"
}

variable "front_tg_port" {
  type    = number
  default = 8080
}

#############################
## Load Balancer Variables ##
#############################

variable "front_lb_name" {
  type    = string 
  default = "LB-Group3-front-tf"
}

variable "front_lb_type" {
  type    = string
  default = "application"
}

variable "front_lbl_protocol" {
  type    = string
  default = "HTTP"
}

variable "front_lbl_port" {
  type    = string
  default = 8080
}

