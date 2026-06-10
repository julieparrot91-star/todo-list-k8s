resource "azurerm_kubernetes_cluster" "aks_cluster" {
  name                = "aks_cluster"
  location            = var.location
  resource_group_name = var.rg_name
  dns_prefix          = "cluster-dns"

   default_node_pool {
       name           = "defaultpool"
       node_count     = 1
       vm_size        = "Standard_D2s_v3"
       vnet_subnet_id = var.aks_subnet_id
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
                network_plugin     = "azure"
                service_cidr       = "10.1.0.0/16"
                dns_service_ip    = "10.1.0.10"
  }

  tags = {
    environment = var.environment
  }
  oidc_issuer_enabled = true
}
