variable "vpc_01_sg_01_name" {
  description = "Name of Security Group 01"
  type        = string
}

variable "vpc_01_sg_01_ingress_rules" {
  description = "List of Ingress Rules in Security Group 01"
  type = list(object({
    description = optional(string)
    from_port   = number
    to_port     = number
    protocol    = optional(string, "tcp")
    cidr_blocks = optional(list(string), ["0.0.0.0/0"])
  }))
}
