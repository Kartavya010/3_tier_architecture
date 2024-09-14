# Creating External LoadBalancer
# Create an Application Load Balancer
resource "aws_lb" "infra_suplierX_LoadBalancer" {
  name               = "infra-supplierX-LoadBalancer"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.infra_alb_sg.id]
  subnets            = [aws_subnet.infra-publicsubnet-1.id, aws_subnet.infra-publicsubnet-2.id]

  tags = {
    Name = "${var.tagname}_suplierX_alb"
  }
}

# Create a target group for the EC2 instances
resource "aws_lb_target_group" "infra_suplierX_target_group" {
  name        = "infra-supplierX-targetgroup"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.infra_suplierXvpc.id

  tags = {
    Name = "${var.tagname}_suplierX_tg"
  }
}

# Register the EC2 instances with the target group
resource "aws_lb_target_group_attachment" "infra_suplierX_group_attachment" {
  count             = 3
  target_group_arn  = aws_lb_target_group.infra_suplierX_target_group.arn  # Corrected reference
  target_id         = aws_instance.infra_supplierx.id  # Ensure to provide correct instance IDs here
  port              = 3000
}

# Create a listener to forward traffic to the target group
resource "aws_lb_listener" "infra_suplierXlistener" {
  load_balancer_arn = aws_lb.infra_suplierX_LoadBalancer.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_lb_target_group.infra_suplierX_target_group.arn
    type             = "forward"
  }
}

data "aws_availability_zones" "available" {
  state = "available"
}
