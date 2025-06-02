output "instance_public_ip" {
  description = "Public IP of the EC2 instance"
  value       = aws_instance.ec2_instance.public_ip
}

output "pem_file_path" {
  description = "Path to the generated PEM file"
  value       = local_file.pem_file.filename
}
