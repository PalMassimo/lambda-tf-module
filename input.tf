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
  })
}
