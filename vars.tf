variable "access_key" {
  default = "*******************"
}

variable "secret_key" {
  default = "****************************"
  
}

# Defining CIDR Block for VPC
variable "vpc_cidr" {
  type = string
  default = ""
}
# Defining CIDR Block for 1st publicSubnet
variable "subnet_cidr" {
  type = string
  default = ""
}
# Defining CIDR Block for 2nd publicSubnet
variable "subnet1_cidr" {
  type = string
  default = ""
}
# Defining CIDR Block for 3rd publicSubnet
variable "subnet2_cidr" {
  type = string
  default = ""
}
# Defining CIDR Block for 4th Subnet
variable "subnet3_cidr" {
  type = string
  default = ""
}
# Defining CIDR Block for 5th Subnet
variable "subnet4_cidr" {
  type = string
  default = ""
}
# Defining CIDR Block for 6th Subnet
variable "subnet5_cidr" {
  type = string
  default = ""
}

variable "engine_version" {
  type = string
  default = ""
}

variable "instance_class" {
  type = string
  default = ""
}

variable "cluster_identifier" {
  type = string
  default = ""
  
}

variable "engine" {
  type = string
  default = ""
  
}

variable "database_name" {
  type = string
  default = ""
  
}

variable "master_username" {
  type = string
  default = ""
  
}

variable "master_password"{
  type = string
  default = ""
}

variable "Jump_server_ebs_size" {
  type = number
 

}

variable "Supplier_x_server_ebs_size" {
  type = number
 

}

variable "jump_server_tag_name" {
  type = string
  default = ""
  
}

variable "supplier_x_tag_name" {
  type = string
  default = ""
  
}

variable "instance_type_jump_server" {
  type = string
  default = ""
  
}

variable "instance_type_supplier_x_server" {
  type = string
  default = ""
  
}

variable "tagname" {
  type = string
  default = ""
  
}

variable "vpc_tag" {
  type = string
  default = ""
  
}

variable "key_name" {
  type = string
  default = ""
}