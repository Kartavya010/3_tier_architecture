

resource "aws_key_pair" "my_key_pair" {
  key_name   = "${var.key_name}"
  public_key = tls_private_key.my_key.public_key_openssh
}

resource "tls_private_key" "my_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Save the private key locally
resource "local_file" "my_private_key" {
  content  = tls_private_key.my_key.private_key_pem
  filename = "${path.module}/my-key-pair.pem"
}

# Move the private key to the Downloads folder using local-exec
resource "null_resource" "move_key" {
  depends_on = [local_file.my_private_key]

  provisioner "local-exec" {
    command = "mv ${path.module}/my-key-pair.pem ~/Downloads/"
  }
}

output "key_name" {
  value = aws_key_pair.my_key_pair.key_name
}

output "private_key_path" {
  value = "${path.module}/my-key-pair.pem"
}
