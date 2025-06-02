variable "aws_region" {
  description = "AWS region"
  default     = "us-east-1"
}

variable "ami_id" {
  description = "AMI ID to use"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  default     = "t2.micro"
}

variable "key_name" {
  description = "Key pair name"
  default     = "my-ec2-key"
}

variable "subnet_id" {
  description = "Existing subnet ID"
  type        = string
}

variable "security_group_id" {
  description = "Existing security group ID"
  type        = string
}
