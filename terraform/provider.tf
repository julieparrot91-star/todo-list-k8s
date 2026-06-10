terraform {
        required_version = ">= 1.0"
        required_providers {
                azurerm = {
                        source = "hashicorp/azurerm"
                        version = "~> 3.0"
                }
		azurecaf = {
         		source  = "aztfmod/azurecaf"
         		version = "2.0.0-preview3"
       }
        }
}

provider "azurerm" {
        features {}
}

provider "azurecaf" {
  # Configuration options
}

