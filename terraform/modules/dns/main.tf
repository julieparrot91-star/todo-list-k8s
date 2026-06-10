resource "azurerm_dns_zone" "this" {
  name                = var.dns_zone_name
  resource_group_name = var.rg_name
}

resource "azurerm_user_assigned_identity" "this" {
  name                = "${substr(var.environment, 0, 3)}-${var.location}-externaldns-01"
  location            = var.location
  resource_group_name = var.rg_name
}

resource "azurerm_federated_identity_credential" "this" {
  name                = "${var.oidc.kubernetes_cluster_name}-ServiceAccount-${var.oidc.kubernetes_namespace}-${var.oidc.kubernetes_serviceaccount_name}"
  resource_group_name = var.rg_name
  audience            = var.oidc.audience
  issuer              = var.oidc.issuer_url
  parent_id           = azurerm_user_assigned_identity.this.id
  subject             = "system:serviceaccount:${var.oidc.kubernetes_namespace}:${var.oidc.kubernetes_serviceaccount_name}"
}

resource "azurerm_role_assignment" "dns_zone_contributor" {
  principal_id                     = azurerm_user_assigned_identity.this.principal_id
  role_definition_name             = "DNS Zone Contributor"
  scope                            = azurerm_dns_zone.this.id
  skip_service_principal_aad_check = true
}
