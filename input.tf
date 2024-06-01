variable "account" {
    type = string
    description = "account number in which deploy defined resources"
}

variable "region" {
  type = string
  description = "the region where deploy resources"
}

variable "prefix" {
  type = string
  default = ""
  description = "the prefix name of each resources"
}

variable "source_dir" {
  type = string
}

variable "configuration" {
  type = object({
    function_name                  = string
    description                    = optional(string, "")
    handler                        = string
    layers                         = optional(list(string), [])
    runtime                        = optional(string, "python3.11")
    architectures                  = optional(list(string), ["x86_64"])
    timeout                        = optional(number, 10)
    environment_variables          = optional(map(string), {})
    cloudwatch_logs_days_retention = optional(number, 7)
    tracing_mode                   = optional(string, "PassThrough")
    ipv6_allowed_for_dual_stack    = optional(bool, false)
    subnet_ids                     = optional(set(string), [])
    security_group_ids             = optional(set(string), [])
    permissions = optional(list(object({
      effect    = optional(string, "Allow")
      actions   = list(string)
      resources = list(string)
    })), [])
  })
}
