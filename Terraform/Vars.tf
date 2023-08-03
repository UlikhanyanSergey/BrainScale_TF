# Variables
variable "key" {
  type    = string
  default = "InternBrainScale-key"
}

variable "region" {
  type    = string
  default = "eu-central-1"
}

variable "first_zone" {
  type    = string
  default = "eu-central-1a"
}

variable "second_zone" {
  type    = string
  default = "eu-central-1b"
}

variable "image_id" {
  type    = string
  default = "ami-0ab1a82de7ca5889c"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}