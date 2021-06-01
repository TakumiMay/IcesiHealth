#######################################
## Resource to create security group ##
#######################################

resource "aws_security_group" "sg-front-instance" {
  description = var.front_sg_description
  vpc_id      = data.aws_vpc.automation-vpc.id

  ingress {
    description = var.front_sg_ingress_ssh_description
    from_port   = var.front_sg_ingress_ssh_port
    to_port     = var.front_sg_ingress_ssh_port
    protocol    = var.front_sg_ingress_ssh_protocol
    cidr_blocks = var.front_sg_ingress_ssh_cird
  }
  
  ingress {
    description = var.front_sg_ingress_app_description
    from_port   = var.front_sg_ingress_app_port
    to_port     = var.front_sg_ingress_app_port
    protocol    = var.front_sg_ingress_app_protocol
    cidr_blocks = var.front_sg_ingress_app_cird
  }

  egress {
    description = var.front_sg_egress_description
    from_port   = var.front_sg_egress_port
    to_port     = var.front_sg_egress_port
    protocol    = var.front_sg_egress_protocol
    cidr_blocks = var.front_sg_egress_cird
  }

  tags = {
    "responsible" = var.tag_responsible
  }
}

resource "aws_security_group" "sg-load-balancer-front" {
  description = var.lb_sg_description
  vpc_id = data.aws_vpc.automation-vpc.id

  ingress {
    description = var.lb_sg_in_traffic_description
    from_port   = var.lb_sg_in_traffic_port
    to_port     = var.lb_sg_in_traffic_port
    protocol    = var.lb_sg_in_traffic_protocol
    cidr_blocks = var.lb_sg_in_traffic_cird
  }

  egress {
    description = var.front_sg_egress_description
    from_port   = var.front_sg_egress_port
    to_port     = var.front_sg_egress_port
    protocol    = var.front_sg_egress_protocol
    cidr_blocks = var.front_sg_egress_cird
  }

  tags = {
    "responsible" = var.tag_responsible
  }
}

##########################################
## Resource to create a launch template ##
##########################################

resource "aws_launch_template" "launch-template-front" {
  image_id               = var.ami_id
  name                   = var.front_launch_template_name
  instance_type          = var.front_launch_template_instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [ aws_security_group.sg-front-instance.id ]

  user_data = base64encode(templatefile("./instances.sh", {back_host = "localhost", tag="latest"}))

  tags = {
    "responsible" = var.tag_responsible
  }
  
    tag_specifications {
    resource_type = "volume"
    
    tags = {
        "responsible" = var.tag_responsible
    }
  }

  tag_specifications {
    resource_type = "instance"
    
    tags = {
        "responsible" = var.tag_responsible,
        "Name"        = var.front_launch_template_instance_name
    }
  }
}


##############################################
## Resource to create an auto scaling group ##
##############################################

resource "aws_autoscaling_group" "front-tf-automation-asg" {
  max_size            = 2
  min_size            = 0
  desired_capacity    = 1
  vpc_zone_identifier = [ data.aws_subnet.public-subnet-2a.id, data.aws_subnet.public-subnet-2a.id ]
  target_group_arns   = [ aws_lb_target_group.front-target-group.arn ]

  launch_template {
    id      = aws_launch_template.launch-template-front.id
    version = "$Latest"
  }

  tags = [ {
    "responsible" = var.tag_responsible
  } ]
}

########################################
## Resource to create a target groupe ## 
########################################

resource "aws_lb_target_group" "front-target-group" {
#  target_type = var.front_tg_target_type
  protocol    = var.front_tg_protocol
  port        = var.front_tg_port
  vpc_id      = data.aws_vpc.automation-vpc.id

  health_check {
#    path                = "/"
    protocol            = "HTTP"
    port		= 80
#    matcher             = "200"
#    interval            = 30
#    timeout             = 5
    healthy_threshold   = 5
    unhealthy_threshold = 2 
  }

  tags = {
      "responsible" = var.tag_responsible
  }
}

#####################################################
## Resource to create an Gateway load balancer ##
#####################################################

resource "aws_lb" "front-tf-gateway-load-balancer" {
  name               = var.front_lb_name
  load_balancer_type = var.front_lb_type
  subnets            = [ data.aws_subnet.public-subnet-2a.id, data.aws_subnet.public-subnet-2a.id ]
#  security_groups    = [ aws_security_group.sg-load-balancer-front.id ]

  tags = {
      "responsible" = var.tag_responsible
  }
}

########################################
## Resource to create a listener rule ##
########################################
 
resource "aws_lb_listener" "http-front" {
  load_balancer_arn = aws_lb.front-tf-gateway-load-balancer.id
#  protocol          = var.front_lbl_protocol
#  port              = var.front_lbl_port

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.front-target-group.id
  }
}
