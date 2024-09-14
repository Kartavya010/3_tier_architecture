
# Create DB Subnet Group
resource "aws_db_subnet_group" "infra-db-subnet-group" {
  name       = "supplier_db_subnet_group"
  subnet_ids = [aws_subnet.infra-Private-subnet-1.id, aws_subnet.infra-Private-subnet-2.id,aws_subnet.infra-Private-subnet-3.id]  # Specify your subnet IDs
}


resource "aws_rds_cluster_instance" "writer_instances" {
  count              = 1
  identifier         = "aurora-cluster-demo-${count.index}"
  cluster_identifier = aws_rds_cluster.infracluster.id
  instance_class     = "${var.instance_class}"
  engine             = aws_rds_cluster.infracluster.engine
  engine_version     = "${var.engine_version}"
  availability_zone = "ap-south-1a"
}

resource "aws_rds_cluster_instance" "reader_instance" {
  count              = 1
  identifier         = "aurora-cluster-demo-0-rds"
  cluster_identifier = aws_rds_cluster.infracluster.id
  instance_class     = "db.t4g.medium"
  engine             = aws_rds_cluster.infracluster.engine
  engine_version     = aws_rds_cluster.infracluster.engine_version
  availability_zone  = "ap-south-1b"
}

# Create Aurora Cluster
resource "aws_rds_cluster" "infracluster" {
  cluster_identifier      = "${var.cluster_identifier}"
  engine                  = "${var.engine}"
  engine_version          = "${var.engine_version}"
  database_name           = "${var.database_name}"
  #storage_type            = "gp3"
  
  master_username         = "${var.master_username}"
  master_password         = "${var.master_password}"
  db_subnet_group_name    = aws_db_subnet_group.infra-db-subnet-group.name
  vpc_security_group_ids  = ["${aws_security_group.infra_steel.id}"] # Specify your security group ID(s)
  availability_zones      = ["ap-south-1a"]
  preferred_backup_window = "07:00-09:00"  
  skip_final_snapshot     = true
  deletion_protection = true
}

