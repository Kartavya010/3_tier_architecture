 # Creating 1st public subnet 

resource "aws_subnet" "infra-publicsubnet-1" {
  vpc_id                  = "${aws_vpc.infra_suplierXvpc.id}"
  cidr_block             = "${var.subnet_cidr}"
  map_public_ip_on_launch = true
  availability_zone = "ap-south-1a"

  tags = {
    Name = "${var.tagname}_public_subnet_1"
  }
}

# Creating 2nd public subnet

resource "aws_subnet" "infra-publicsubnet-2" {
  vpc_id                  = "${aws_vpc.infra_suplierXvpc.id}"
  cidr_block             = "${var.subnet1_cidr}"
  map_public_ip_on_launch = true
  availability_zone = "ap-south-1b"

  tags = {
    Name = "${var.tagname}_public_subnet_2"
  }
}



# Creating 3rd public subnet

resource "aws_subnet" "infra-publicsubnet-3" {
  vpc_id                  = "${aws_vpc.infra_suplierXvpc.id}"
  cidr_block             = "${var.subnet2_cidr}"
  map_public_ip_on_launch = true
  availability_zone = "ap-south-1c"

  tags = {
    Name = "${var.tagname}_public_subnet_3"
  }
}

# Creating 1st private subnet 

resource "aws_subnet" "infra-Private-subnet-1" {
  vpc_id                  = "${aws_vpc.infra_suplierXvpc.id}"
  cidr_block             = "${var.subnet3_cidr}"
  map_public_ip_on_launch = false
  availability_zone = "ap-south-1a"

  tags = {
    Name = "${var.tagname}_private_subnet_1"
  }
}

# Creating 2nd private Subnet

resource "aws_subnet" "infra-Private-subnet-2" {
  vpc_id                  = "${aws_vpc.infra_suplierXvpc.id}"
  cidr_block             = "${var.subnet4_cidr}"
  map_public_ip_on_launch = false
  availability_zone = "ap-south-1b"

  tags = {
    Name = "${var.tagname}_private_subnet_2"
  }
}

#creating 3rd private subnet

resource "aws_subnet" "infra-Private-subnet-3" {
  vpc_id                  = "${aws_vpc.infra_suplierXvpc.id}"
  cidr_block             = "${var.subnet5_cidr}"
  map_public_ip_on_launch = false
  availability_zone = "ap-south-1c"

  tags = {
    Name = "${var.tagname}_private_subnet_3"
  }
}

