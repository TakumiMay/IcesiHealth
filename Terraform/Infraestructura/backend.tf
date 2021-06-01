#######################################
## Resource to create security group ##
#######################################

resource "aws_security_group" "sg-back-instance" {
  description = var.back_sg_description
  vpc_id      = data.aws_vpc.automation-vpc.id

  ingress {
    description = var.back_sg_ingress_ssh_description
    from_port   = var.back_sg_ingress_ssh_port
    to_port     = var.back_sg_ingress_ssh_port
    protocol    = var.back_sg_ingress_ssh_protocol
    cidr_blocks = var.back_sg_ingress_ssh_cird
  }
  
  ingress {
    description = var.back_sg_ingress_app_description
    from_port   = var.back_sg_ingress_app_port
    to_port     = var.back_sg_ingress_app_port
    protocol    = var.back_sg_ingress_app_protocol
    cidr_blocks = var.back_sg_ingress_app_cird
  }

  egress {
    description = var.back_sg_egress_description
    from_port   = var.back_sg_egress_port
    to_port     = var.back_sg_egress_port
    protocol    = var.back_sg_egress_protocol
    cidr_blocks = var.back_sg_egress_cird
  }

  tags = {
    "responsible" = var.tag_responsible
  }
}

resource "aws_security_group" "sg-load-balancer-back" {
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
    description = var.back_sg_egress_description
    from_port   = var.back_sg_egress_port
    to_port     = var.back_sg_egress_port
    protocol    = var.back_sg_egress_protocol
    cidr_blocks = var.back_sg_egress_cird
  }

  tags = {
    "responsible" = var.tag_responsible
  }
}

##########################################
## Resource to create a launch template ##
##########################################

resource "aws_launch_template" "launch-template-back" {
  image_id               = var.ami_id
  name                   = var.back_launch_template_name
  instance_type          = var.back_launch_template_instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [ aws_security_group.sg-back-instance.id ]

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
        "Name"        = var.back_launch_template_instance_name
    }
  }
}


##############################################
## Resource to create an auto scaling group ##
##############################################

resource "aws_autoscaling_group" "back-tf-automation-asg" {
  max_size            = 2
  min_size            = 0
  desired_capacity    = 1
  vpc_zone_identifier = [ data.aws_subnet.private-subnet-2a.id, data.aws_subnet.private-subnet-2c.id ]
  target_group_arns   = [ aws_lb_target_group.back-target-group.arn ]

  launch_template {
    id      = aws_launch_template.launch-template-back.id
    version = "$Latest"
  }

  tags = [ {
    "responsible" = var.tag_responsible
  } ]
}

#######################################
## Resource to create a target group ## 
#######################################

resource "aws_lb_target_group" "back-target-group" {
  target_type = var.back_tg_target_type
  protocol    = var.back_tg_protocol
  port        = var.back_tg_port
  vpc_id      = data.aws_vpc.automation-vpc.id

  health_check {
    path                = "/"
    protocol            = "HTTP"
    matcher             = "200"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 5
    unhealthy_threshold = 2 
  }

  tags = {
      "responsible" = var.tag_responsible
  }
}

#####################################################
## Resource to create an Application load balancer ##
#####################################################

resource "aws_lb" "back-tf-application-load-balancer" {
  name               = var.back_lb_name
  load_balancer_type = var.back_lb_type
  subnets            = [ data.aws_subnet.private-subnet-2a.id, data.aws_subnet.private-subnet-2c.id ]
  security_groups    = [ aws_security_group.sg-load-balancer-back.id ]
  internal           = true

  tags = {
      "responsible" = var.tag_responsible
  }
}

########################################
## Resource to create a listener rule ##
########################################
 
resource "aws_lb_listener" "http-back" {
  load_balancer_arn = aws_lb.back-tf-application-load-balancer.arn
  protocol          = var.back_lbl_protocol
  port              = var.back_lbl_port

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.back-target-group.arn
  }
}
