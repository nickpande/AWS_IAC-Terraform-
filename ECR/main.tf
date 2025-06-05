provider "aws" {
  region = "us-east-1" # Change to your desired region
}

resource "aws_ecr_repository" "my_repo" {
  name                 = "my-container-repo"  # Replace with your desired repo name
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Environment = "dev"
    Name        = "MyContainerRepo"
  }
}
