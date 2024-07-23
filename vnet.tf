resource "azurerm_virtual_network" "tf-vnet01" {
  name                = var.vnetname
  resource_group_name = azurerm_resource_group.tf-vnetrg.name
  location            = azurerm_resource_group.tf-vnetrg.location
  address_space       = var.vnetaddr
  tags = local.commontags
}

resource "azurerm_subnet" "tf-sbt01" {
  name                 = var.sbt01name
  virtual_network_name = azurerm_virtual_network.tf-vnet01.name
  resource_group_name  = azurerm_resource_group.tf-vnetrg.name
  address_prefixes     = var.sbt01addr
}

resource "azurerm_subnet" "tf-sbt02" {
  name                 = var.sbt02name
  virtual_network_name = azurerm_virtual_network.tf-vnet01.name
  resource_group_name  = azurerm_resource_group.tf-vnetrg.name
  address_prefixes     = var.sbt02addr
}