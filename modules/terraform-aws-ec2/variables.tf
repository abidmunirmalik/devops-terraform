variable "instance_type" {
  type = string
}

variable "ec2_name" {
  type = string
}

variable "public_ip" {
  type = bool
}

variable "sg_ids" {
  type = list(string)
}

variable "key_name" {
  type = string
}

variable "prefix" {
  type = string
}