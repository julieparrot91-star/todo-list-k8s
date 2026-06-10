resource "azurerm_resource_group" "aks" {
	name = var.rg_name
	location = var.location
}

module "network" {
        source = "./modules/network"
        rg_name = azurerm_resource_group.aks.name
        location = azurerm_resource_group.aks.location
        aks_cidr = "10.0.0.0/16"
        aks_subnet_cidr = "10.0.1.0/24"
}

module "aks-cluster" {
	source = "./modules/k8s"
	rg_name = azurerm_resource_group.aks.name
	location = azurerm_resource_group.aks.location
	environment = var.environment
        aks_subnet_id = module.network.aks_subnet_id
}

module "dns" {
	source = "./modules/dns"
	rg_name = azurerm_resource_group.aks.name
	location = azurerm_resource_group.aks.location
	environment = var.environment
	dns_zone_name = var.dns_zone_name
	oidc = var.oidc
}
