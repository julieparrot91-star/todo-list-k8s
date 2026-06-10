variable "location" {
	type = string
	description = "Region of azure"
}

variable "rg_name" {
	type = string
	description = "name of resource group"
}

variable "dns_zone_name" {
  type        = string
  description = "dns zone name like example.com"
}

variable "environment" {
	type = string
	description = ""
}

variable "oidc" {
  type = object({
    audience                       = optional(list(string), ["api://AzureADTokenExchange"])
    issuer_url                     = string
    kubernetes_namespace           = optional(string, "external-dns")
    kubernetes_serviceaccount_name = optional(string, "external-dns")
    kubernetes_cluster_name        = string
  })
  description = "Configure OIDC federation settings to establish a trusted token mechanism between the Kubernetes cluster and external systems."
}
