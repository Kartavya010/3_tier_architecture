# Creating Route Table for public subnets
resource "aws_route_table" "route" {
    vpc_id = aws_vpc.infra_suplierXvpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id =   aws_internet_gateway.infraigwgateway.id
    }

    tags = {
        Name = "infra_route_table"
    }
}


# Route Table for Private Subnet
resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.infra_suplierXvpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat.id
  }
}

# Associating Route Table
resource "aws_route_table_association" "rt1" {
    subnet_id = aws_subnet.infra-publicsubnet-1.id
    route_table_id = aws_route_table.route.id
}

# Associating Route Table
resource "aws_route_table_association" "rt2" {
    subnet_id = aws_subnet.infra-publicsubnet-2.id
    route_table_id = aws_route_table.route.id
}

# Associating Route Table
resource "aws_route_table_association" "rt3" {
    subnet_id = aws_subnet.infra-publicsubnet-3.id
    route_table_id = aws_route_table.route.id
}

resource "aws_route_table_association" "rt4" {
    subnet_id = aws_subnet.infra-Private-subnet-1.id
    route_table_id = aws_route_table.private_route_table.id
}

# Associating Route Table
resource "aws_route_table_association" "rt5" {
    subnet_id = aws_subnet.infra-Private-subnet-2.id
    route_table_id = aws_route_table.private_route_table.id
}

# Associating Route Table
resource "aws_route_table_association" "rt6" {
    subnet_id = aws_subnet.infra-Private-subnet-3.id
    route_table_id = aws_route_table.private_route_table.id
} 

