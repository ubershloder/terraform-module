################################################################
#                      AWS instance vars                       #
################################################################
variable "aws_instance_type" {
  description = "AWS instance type that will be launched"
  type        = string
  default     = "t2.micro"
}
variable "public_ip" {
  description = "Define if public IP will be associated at launch"
  default     = true
}
variable "api_termination" {
  description = "Enable/Disable API termination lock"
  default     = false
}
variable "hibernation" {
  description = "If true instance will be launched with hibernation support"
  default     = false
}
variable "monitoring_option" {
  description = "If true then instance will have detailed monitoring turned on"
  default     = true
}
################################################################
#                         AWS VPC vars                         #
################################################################
variable "vpc_cidr" {
  description = "CIDR block definition for VPC"
  type        = string
  default     = "192.168.0.0/16"
}
variable "instance_tenancy" {
  description = "Default makes your instances shared on the host. Using other options costs at least $2/hr"
  type        = string
  default     = "default"
}
variable "dns_hostnames" {
  description = "Enable DNS in this VPC"
  default     = false
}
variable "dns_support" {
  description = "Enable DNS inside of VPC"
  default     = true
}
###############################################################
#                      AWS subnets vars                       #
###############################################################
variable "first_subnet_cidr" {
  description = "CIDR block for first subnet"
  type        = string
  default     = "192.168.1.0/24"
}
variable "second_subnet_cidr" {
  description = "CIDR block for second subnet"
  type        = string
  default     = "192.168.2.0/24"
}
### AWS route table var
variable "all_cidr" {
  description = "CIDR for route table"
  type        = string
  default     = "0.0.0.0/0"
}


