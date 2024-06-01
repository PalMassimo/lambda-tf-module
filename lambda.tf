resource "aws_lambda_function" "lambda" {
  function_name    = "${var.prefix}-${var.configuration.function_name}-lambda"
  description      = var.configuration.description
  handler          = var.configuration.handler
  layers           = var.configuration.layers
  runtime          = var.configuration.runtime
  timeout          = var.configuration.timeout
  role             = aws_iam_role.role.arn
  filename         = data.archive_file.zip.output_path
  source_code_hash = data.archive_file.zip.output_base64sha256

  tracing_config {
    mode = var.configuration.tracing_mode
  }

  environment {
    variables = var.configuration.environment_variables
  }

  vpc_config {
    ipv6_allowed_for_dual_stack = var.configuration.ipv6_allowed_for_dual_stack
    security_group_ids          = var.configuration.security_group_ids
    subnet_ids                  = var.configuration.subnet_ids
  }

}

data "archive_file" "zip" {
  type        = "zip"
  source_dir  = var.source_dir
  output_path = "${path.module}/${var.source_dir}.zip"
}
