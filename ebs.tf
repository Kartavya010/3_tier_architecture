
resource "aws_ebs_volume" "infra_suplierx_ebs" {
  availability_zone = "ap-south-1a"
  size             = "${var.Supplier_x_server_ebs_size}"
  type             =  "gp3"

  tags = {
    Name = "infra_ebs"
  }
}

resource "aws_volume_attachment" "infra_ebs_att" {
  device_name = "/dev/sdh"
  instance_id = aws_instance.infra_supplierx.id
  volume_id   = aws_ebs_volume.infra_suplierx_ebs.id
}


resource "aws_ebs_volume" "jump_server_ebs" {
  availability_zone = "ap-south-1a"
  size              = "${var.Jump_server_ebs_size}"
  type = "gp3"

  tags = {
    Name = "infra_ebs_jumpserver"
  }
}

resource "aws_volume_attachment" "infra_ebs_att_jumpserver" {
  device_name = "/dev/sdj"
  instance_id = aws_instance.jump_server.id
  volume_id   =  aws_ebs_volume.jump_server_ebs.id
}

