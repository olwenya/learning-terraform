variable "server_port" {
  description = "The port number for incoming http requests"
  type        = number
  default     = 8080
  sensitive   = false
}

variable "image_id" {
  description = "ami id"
  type = string
  sensitive = false
}

variable "instance_type" {
  default = "t2.micro"
  type = string
  sensitive = false
}

variable "server_text" {
  description = "the text the web server returns"
  type = string
  default = "Hello World"
}

variable "asg_min_size" {
  description = "minimum number of instances for ASG group"
  type = number
  default = 1
  sensitive = false

  validation {
    condition = var.asg_min_size > 0
    error_message = "ASG should be > 0"
  }
}
