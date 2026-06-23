# ATTENTION: Ce fichier doit être complété avec vos valeurs
# Copier ce fichier en terraform.tfvars et remplir les valeurs manquantes

location        = "West Europe"
rg_name         = "aks_todo"
environment     = "test"
dns_zone_name   = "julienp-kubernetes.click"

# Secrets à définir via variables d'environnement:
# export TF_VAR_client_id="votre-client-id"
# export TF_VAR_client_secret="votre-client-secret"
# export TF_VAR_tenant_id="votre-tenant-id"
# export TF_VAR_grafana_url="https://votre-instance.grafana.net"
# export TF_VAR_grafana_auth="glsa_votre-token"
client_id     = "YOUR_CLIENT_ID"
client_secret = "YOUR_CLIENT_SECRET"  # Sensitive - utiliser TF_VAR_client_secret
tenant_id     = "YOUR_TENANT_ID"
scope         = "openid email profile"

oidc = {
  issuer_url              = "YOUR_OIDC_ISSUER_URL"
  kubernetes_cluster_name = "aks_cluster"
  kubernetes_namespace    = "external-dns"
  audience               = ["api://AzureADTokenExchange"]
}

# Grafana configuration (pour le provider Grafana)
grafana_url  = "https://your-instance.grafana.net"
grafana_auth = "YOUR_GRAFANA_TOKEN"  # Sensitive - utiliser TF_VAR_grafana_auth