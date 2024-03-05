#AWS VARIABLES
variable "aws_access_key" {
  type        = string
  description = "AWS Access Key ID you'd like to use."
}

variable "aws_secret_key" {
  type        = string
  description = "AWS Secret Key you'd like to use."
  sensitive   = true
}

variable "aws_region" {
  type        = string
  description = "AWS Region you'd like to default to."
  default     = "us-east-1"
}

variable "aws_account" {
  type        = string
  description = "AWS Account Number."
}

variable "aws_user_name" {
  type        = string
  description = "AWS User Name you'd like to have use kubectl."
}