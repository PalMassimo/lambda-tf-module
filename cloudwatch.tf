resource "aws_cloudwatch_log_group" "log_group" {
  name              = "/aws/lambda/${aws_lambda_function.lambda.function_name}"
  retention_in_days = var.configuration.cloudwatch_logs_days_retention
  lifecycle {
    prevent_destroy = false
  }
}