# Ambuja - SupplierX EC2 instance with 3-year Savings Plan

resource "aws_instance" "infra_supplierx" {
  ami                    = "ami-09298640a92b2d12c"  # Specify the AMI for Linux
  instance_type          = "${var.instance_type_supplier_x_server}"
  availability_zone      = "ap-south-1a"  # Specify the desired availability zone
  key_name               =   "infra"
  #key_name               = "your_key_pair"  

  vpc_security_group_ids = ["${aws_security_group.infra_steel.id}"]  # Specify your security group ID(s)
  subnet_id = "${aws_subnet.infra-Private-subnet-1.id}"

  instance_initiated_shutdown_behavior = "stop"  # Stop the instance when terminated


  tags = {
    Name = "${var.supplier_x_tag_name}"
    Environment = "Production"
  }


 
# @ Additional configuration for the instance can be added as needed

}



# Jump Server EC2 instance with On-Demand pricing


resource "aws_instance" "jump_server" {
  ami                    = "ami-05ac570307b6820b7"  # Specify the AMI for Windows
  instance_type          = "${var.instance_type_jump_server}"
  availability_zone      = "ap-south-1a"   # Specify the desired availability zone
  key_name               =   "infra"
  associate_public_ip_address = true
  

  vpc_security_group_ids = ["${aws_security_group.infra_steel.id}"]  # Specify your security group ID(s)
  subnet_id = "${aws_subnet.infra-publicsubnet-1.id}"
  instance_initiated_shutdown_behavior = "terminate"  
  tags = {
    Name = "${var.jump_server_tag_name}"
    Environment = "Development"
  }

  # Additional configuration for the instance can be added as needed
}







