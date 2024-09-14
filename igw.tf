# Creating Internet Gateway 
resource "aws_internet_gateway" "infraigwgateway" {
  vpc_id = aws_vpc.infra_suplierXvpc.id

  tags = {
    Name = "${var.tagname}__igw"
  }
}