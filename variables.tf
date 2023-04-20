variable "region" {
  type = string
  default = "us-west-2"
}

variable "vpc_id" {
  type = string
}

variable "subnet_name" {
  type = string
  default = "public"
}
