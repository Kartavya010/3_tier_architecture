

# Configure the AWS Provider
provider "aws" {
 
  access_key = var.access_key
  secret_key = var.secret_key
   region = "ap-south-1"
}