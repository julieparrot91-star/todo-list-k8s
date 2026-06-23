terraform {
        required_version = ">= 1.0"
        required_providers {
                azurerm = {
                        source = "hashicorp/azurerm"
                        version = "~> 3.0"
                }
		 grafana = {
      			source  = "grafana/grafana"
      			version = "4.38.0"
    		}
        }
}

provider "azurerm" {
        features {}
}

# Configurer via variables d'environnement:
# TF_VAR_grafana_url et TF_VAR_grafana_auth
variable "grafana_url" {
  description = "URL de l'instance Grafana"
  type        = string
}

variable "grafana_auth" {
  description = "Token d'authentification Grafana (sensible)"
  type        = string
  sensitive   = true
}

provider "grafana" {
  url  = var.grafana_url
  auth = var.grafana_auth
}

