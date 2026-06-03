resource "azurerm_virtual_network" "aks" {
        name = "aks-vnet"
        address_space = [var.aks_cidr]
        location = var.location
        resource_group_name = var.rg_name

}

resource "azurerm_subnet" "sub_aks" {
        name = "AksSubnet"
        resource_group_name = var.rg_name
        virtual_network_name = azurerm_virtual_network.aks.name
        address_prefixes = [var.aks_subnet_cidr]
}
