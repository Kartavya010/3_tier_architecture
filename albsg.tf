resource "aws_security_group" "infra_alb_sg" {
  name        = "infra_alb_sg"
  description = "Security group for Application Load Balancer"
  vpc_id =  "${aws_vpc.infra_suplierXvpc.id}"
  // Define ingress rules for ALB
  ingress {
    from_port   = 80 // HTTP port
    to_port     = 80 // HTTP port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] // Allow traffic from any IP address
  }
  
  ingress {
    from_port   = 443 // HTTPS port
    to_port     = 443 // HTTPS port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] // Allow traffic from any IP address
  }
  
  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Replace with appropriate CIDR block
  }
  // Define egress rule to allow all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.tagname}-infra-Alb-sg"
  } 
}
