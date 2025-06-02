provider "aws" {
  region = var.aws_region
}

# Generate a new SSH key pair
resource "tls_private_key" "ec2_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "ec2_key" {
  key_name   = var.key_name
  public_key = tls_private_key.ec2_key.public_key_openssh
}

# Save the private key to a PEM file locally
resource "local_file" "pem_file" {
  content              = tls_private_key.ec2_key.private_key_pem
  filename             = "${path.module}/${var.key_name}.pem"
  file_permission      = "0400"
  directory_permission = "0700"
}

resource "aws_instance" "ec2_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type

  subnet_id              = var.subnet_id
  vpc_security_group_ids = [var.security_group_id]
  key_name               = aws_key_pair.ec2_key.key_name

  tags = {
    Name = "Terraform-EC2"
  }
}
