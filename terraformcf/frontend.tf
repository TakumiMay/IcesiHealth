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
    description = "Outbound rule"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [ "0.0.0.0/0" ]
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
    description = "Outbound rule"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [ "0.0.0.0/0" ]
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

  user_data = base64encode(templatefile("./front.sh", {back_host = "localhost", tag="latest"}))

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
  max_size            = 1
  min_size            = 0
  desired_capacity    = 1
  vpc_zone_identifier = [ data.aws_subnet.public-subnet-2c.id, data.aws_subnet.public-subnet-2a.id ]
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
## Resource to create a target groupe ## Es usado para enrutar solicitudes a uno o mas "objetivos" registrados. 
######################################## Cuando se crea un listener rule, se especifica un target group y sus condiciones.
#                                        Cuando una condición se cumple, el trafico es remitido al grupo objetivo correspondiente.
#                                        Si se estan registrando obejtivos por el ID de la isntancia, se puede usar el balanceador de carga
#                                        con el grupo de auto escalado.

resource "aws_lb_target_group" "front-target-group" {
  target_type = var.front_tg_target_type
  protocol    = var.front_tg_protocol
  port        = var.front_tg_port
  vpc_id      = data.aws_vpc.automation-vpc.id

  # Los balanceadores de carga periodicamente envian solicitudes a sus objetivos registrados para probar su
  # status
  health_check {
    path                = "/"    # This is the destination for the health check request (you can specifya valid URI (/path?query))
    protocol            = "HTTP" # This is the protocol used to connect with the target
    matcher             = "200"  # The http code used when checking for a successful response from a target
    interval            = 30     # The amount of time between health checks of an individual target
    timeout             = 5      # The amount of time during which no response means a failed health check
    healthy_threshold   = 5      # This is the number of consecutive health checks successes requerid before considering an unhealthy target healthy
    unhealthy_threshold = 2      # This is the number of consecutive health checks failures requerid before considering the target unhealthy
  }

  tags = {
      "responsible" = var.tag_responsible
  }
}

#####################################################
## Resource to create an application load balancer ##
#####################################################

resource "aws_lb" "front-tf-application-loag-balancer" {
  name               = var.front_lb_name
  load_balancer_type = var.front_lb_type
  subnets            = [ data.aws_subnet.public-subnet-2c.id, data.aws_subnet.public-subnet-2a.id ]
  security_groups    = [ aws_security_group.sg-load-balancer-front.id ]

  tags = {
      "responsible" = var.tag_responsible
  }
}

########################################
## Resource to create a listener rule ##
########################################

# Un listener es un proceso que comprueba las solicitudes de conexiónm utilizando el protocolo y el 
# puerto que configura. Las reglas que defina para un listener determinan cómo el balancercador de carga
# enruta las solicitudes a sus targets registrados 
resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.front-tf-application-loag-balancer.arn
  protocol          = var.front_lbl_protocol
  port              = var.front_lbl_port

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.front-target-group.arn
  }
}