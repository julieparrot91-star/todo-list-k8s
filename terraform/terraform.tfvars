location = "West Europe"
rg_name = "aks_todo"
environment = "test"
dns_zone_name = "julienp-kubernetes.click"
oidc = {
  issuer_url                      = "https://westeurope.oic.prod-aks.azure.com/a5b75bdf-981b-4790-acdb-7da5e8d808b4/139952f6-6e0a-4fad-a1d8-74cba88b1b3f/"
  kubernetes_cluster_name         = "aks_cluster"
  kubernetes_namespace            = "external-dns"
  audience = ["api://AzureADTokenExchange"]
}
