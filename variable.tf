# vpc variables
variable "vpc_cidr" {
  default     = "10.0.0.0/16"
  description = "vpc cidr block"
  type        = string

  }

  variable "public_subnet_az1_cidr" {
  default     = "10.0.0.0/24"
  description = "public subnet in az1 cidr block"
  type        = string

  }

  variable "public_subnet_az2_cidr" {
  default     = "10.0.1.0/24"
  description = "public subnet in az2 cidr block"
  type        = string

  }

  variable "private_app_subnet_az1_cidr" {
  default     = "10.0.2.0/24"
  description = "private app subnet in az1 cidr block"
  type        = string

  }

  variable "private_app_subnet_az2_cidr" {
  default     = "10.0.3.0/24"
  description = "private app subnet in az2 cidr block"
  type        = string

  }

   variable "private_data_subnet_az1_cidr" {
  default     = "10.0.4.0/24"
  description = "private data subnet in az1 cidr block"
  type        = string

  }

   variable "private_data_subnet_az2_cidr" {
  default     = "10.0.5.0/24"
  description = "private data subnet in az2 cidr block"
  type        = string

  }