variable "region" {
  description = "AWS region"
}

variable "key_name" {
  description = "The AWS key pair to use for resources"
}

variable "ami" {
  type = map(string)
  description = "A map of AMI's"
}

variable "instance_type" {
  description = "The AWS instance type"
  default = "t2.micro"
}

variable "instance_ips" {
  description = "The IP's to use for the instances"
  default = ["10.0.1.20","10.0.1.21"]
}

variable "owner_tag" {
  description = "The owner tag to apply to resources"
  default = ["team-1", "team-2"]
}