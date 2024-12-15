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