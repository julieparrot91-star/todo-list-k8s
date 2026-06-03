variable "location" {
	description = "Azure region"
	type = string
	default = "West Europe"
}

variable "rg_name" {
	description = "Resource group name"
	type = string
}

variable "environment" {
	description = "Environment name (dev, prod)"
	type = string
	default = "dev"
}


