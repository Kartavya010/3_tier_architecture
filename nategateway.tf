resource "aws_eip" "nat_eip" {
  depends_on = [aws_internet_gateway.infraigwgateway]
}
/* NAT */
resource "aws_nat_gateway" "nat" {
  allocation_id = "${aws_eip.nat_eip.id}"
  subnet_id     = "${element(aws_subnet.infra-publicsubnet-1.*.id, 0)}"
  depends_on    = [aws_internet_gateway.infraigwgateway]
  tags = {
    Name        = "${var.tagname}_nat"
    Environment = "Production"
  } 
}


# this code is not updated and currently working on it
