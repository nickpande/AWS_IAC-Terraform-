# AWS_IAC-Terraform-
This repository contains modular and reusable Terraform configurations to provision and manage infrastructure on Amazon Web Services (AWS) using Infrastructure as Code (IaC) principles.
# 🏗️ AWS_IAC (Terraform)

> **Infrastructure as Code on AWS using Terraform**

This repository provides a set of modular and reusable **Terraform configurations** to provision, manage, and automate infrastructure on **Amazon Web Services (AWS)**. It is designed to demonstrate IaC best practices for DevOps workflows, including EC2 provisioning, VPC networking, S3 buckets, IAM roles, and more.

---

## 📌 Features

- 🔁 Reusable Terraform modules
- ☁️ Create and manage AWS EC2, VPC, Subnets, S3, IAM, and Security Groups
- 🔐 Generates PEM files securely using Terraform TLS provider
- 🔧 Supports environment-specific configurations using `.tfvars`
- 📦 Remote backend support for Terraform state (optional)
- 📄 Clean code structure and readable output variables

---

## 📁 Directory Structure

AWS_IAC(Terraform)/
├── modules/ # Reusable Terraform modules
│ ├── ec2/ # EC2 provisioning logic
│ ├── vpc/ # VPC, subnet, route tables
│ └── s3/ # S3 buckets (optional)
├── environments/
│ ├── dev/ # Dev environment config
│ └── prod/ # Prod environment config
├── main.tf # Root module
├── variables.tf # Input variables
├── outputs.tf # Output values
├── backend.tf (optional) # Remote state backend (e.g., S3)
├── README.md




---

## 🚀 Getting Started

### 1. Prerequisites

- [Terraform](https://developer.hashicorp.com/terraform/downloads) v1.5+
- AWS CLI with credentials configured (`aws configure`)
- Permissions to manage EC2, VPC, S3, IAM, etc.

---

### 2. Clone the Repository

```bash
git clone https://github.com/your-username/AWS_IAC-Terraform.git
cd AWS_IAC-Terraform
terraform init
terraform apply -var-file="environments/dev/dev.tfvars"
This setup automatically:

Generates an RSA private key using the tls_private_key resource

Stores the .pem file locally with correct permissions (0400)

Registers the public key with AWS via aws_key_pair

You can use this .pem file to SSH into provisioned EC2 instances.

✅ Example Resources Created
EC2 instance with SSH access

Custom key pair

Existing VPC, Subnet, and Security Group usage

(Optional) S3 Bucket, IAM roles, ECR repo

🧪 Sample Output
makefile
Copy
Edit
Apply complete! Resources: 4 added.

Outputs:
instance_public_ip = "54.123.45.67"
pem_file_path      = "./my-ec2-key.pem"




 TODO (Future Enhancements)
 Add EKS provisioning module

 Integrate with GitHub Actions for CI/CD

 Add monitoring with CloudWatch

 Create Helm chart for Kubernetes deployments