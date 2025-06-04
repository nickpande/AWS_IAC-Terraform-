# main.tf

provider "aws" {
  region = "us-east-1" # change as needed
}

# IAM Role for Lambda
resource "aws_iam_role" "lambda_exec_role" {
  name = "lambda_exec_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action = "sts:AssumeRole",
      Effect = "Allow",
      Principal = {
        Service = "lambda.amazonaws.com"
      }
    }]
  })
}

# Attach AWSLambdaBasicExecutionRole policy
resource "aws_iam_role_policy_attachment" "lambda_basic_execution" {
  role       = aws_iam_role.lambda_exec_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

# Lambda Function
resource "aws_lambda_function" "my_lambda" {
  function_name = "my_lambda_function"
  filename      = "lambda_function_payload.zip"  # Make sure this ZIP is in the same folder or use S3
  source_code_hash = filebase64sha256("lambda_function_payload.zip")
  handler       = "lambda_function.lambda_handler"  # e.g., for Python, this means `lambda_function.py` and function `lambda_handler`
  runtime       = "python3.10"
  role          = aws_iam_role.lambda_exec_role.arn
  timeout       = 15
  memory_size   = 128
}

# Optional: CloudWatch Log Group (created automatically but you can customize)
resource "aws_cloudwatch_log_group" "lambda_logs" {
  name              = "/aws/lambda/${aws_lambda_function.my_lambda.function_name}"
  retention_in_days = 14
}
