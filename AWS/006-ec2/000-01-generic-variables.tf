variable "environment" {
  description = "Type of Environment"
  type        = string
}

variable "app" {
  description = "Name of Application"
  type        = string
  default     = "app"
}

locals {
  prefix = "${var.app}-${var.environment}"
}
