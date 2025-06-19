variable "region" {
  default = "us-east-2"
}

variable "key_pair_name" {
  default = "VPC-Practice"
}

variable "ami" {
  default = "ami-04f167a56786e4b09"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "public_ec2" {
  default = "My-EC2-Public"
}

variable "vpc_cidr_range" {
  default = "10.0.0.0/24"
}
variable "private_ec2" {
  default = "My-EC2-Private"
}

variable "Public_Subnet" {
  default = "10.0.0.0/25"
}

variable "Private_Subnet" {
  default = "10.0.0.128/25"
}