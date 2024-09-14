# Creating VPC
resource "aws_vpc" "infra_suplierXvpc" {
  cidr_block       = "${var.vpc_cidr}"
  instance_tenancy = "default"

  tags = {
    Name = "${var.vpc_tag}"
  }
}