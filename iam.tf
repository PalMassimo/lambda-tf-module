resource "aws_iam_role" "role" {
  name               = "${var.prefix}-${var.configuration.function_name}-lambda-role"
  description        = "iam role for ${var.configuration.function_name} lambda"
  assume_role_policy = data.aws_iam_policy_document.trust_policy.json
}

resource "aws_iam_role_policy" "role_policy" {
  name   = "${var.prefix}-${var.configuration.function_name}-lambda-role-policy"
  role   = aws_iam_role.role.id
  policy = data.aws_iam_policy_document.permissions_policy.json
}

data "aws_iam_policy_document" "trust_policy" {
  statement {
    effect = "Allow"
    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
    actions = ["sts:AssumeRole"]
  }
}

data "aws_iam_policy_document" "permissions_policy" {
  dynamic "statement" {
    for_each = var.configuration.permissions
    content {
      effect    = statement.value["effect"]
      actions   = statement.value["actions"]
      resources = statement.value["resources"]
    }
  }
  statement {
    effect = "Allow"
    actions = [
      "logs:CreateLogStream",
      "logs:PutLogEvents"
    ]
    resources = [
      "${aws_cloudwatch_log_group.log_group.arn}:*"
    ]
  }
}