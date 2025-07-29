variable "aws_region" {
  type        = string
  default     = "us-east-1"
}

variable "app_name" {
  type        = string
  default     = "flask-app"
}

variable "image_url" {
  default = "<AWS-Account-ID>.dkr.ecr.us-east-1.amazonaws.com/flask-app:latest"
  type    = string
}

variable "email_address" {
  default = "youremailaddress@something.com"
  type    = string
}
