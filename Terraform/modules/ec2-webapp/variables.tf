
variable "ami_id" {
  type        = string
  description = "The AMI ID to use for the web server"
  default     = "ami-0505148b3591e4c07" //Ubuntu Server 20.04
}

variable "instance_type" {
  type        = string
  description = "The instance type of the EC2 instance"
  default     = "t2.micro"
}

variable "user_data" {
  description = "User data to initialize the EC2 instance"
  type        = string
  default     = ""
}
variable "domain" {
  description = "The domain name for the website"
  type        = string
}

variable "environment_name" {
  description = "Deployment environment (dev/staging/production)"
  type        = string
}

variable "key_name" {
  description = "The name of the SSH key pair to attach to the EC2 instances"
  type        = string
  default = ""
}

variable "create_dns_zone" {
  description = "If true, create new route53 zone, if false read existing route53 zone"
  type        = bool
  default     = false
}