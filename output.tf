output "function_name" {
  value = var.configuration.function_name
  description = "the function name without prefix and suffix"
}

# output "function_fullname" {
#   value = aws_lambda_function.lambda.function_name
#   description = "the function name with prefix and suffix"
# }

# output "function_arn" {
#   value = aws_lambda_function.lambda.arn
# }

# output "function_invoke_arn" {
#   value = aws_lambda_function.lambda.invoke_arn
# }

output "function_role_name" {
  value = aws_iam_role.role.name
}

output "function_role_arn" {
  value = aws_iam_role.role.arn
  description = "the role arn of the lambda"
}
