variable "profile" {
  default = "default"
}

variable "env" {
  type = string
}

variable "name" {
  default = "sample"
}

variable "region" {
  default = "ap-northeast-1"
}

variable "vpc_id" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "security_group_id" {
  type = string
  description = "for access allow"
}

variable "instance_type" {
  default = "t3.nano"
}
