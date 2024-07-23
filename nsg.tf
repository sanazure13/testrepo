##Public subnet NSG##
resource "azurerm_network_security_group" "tf-pusunsg" {
  name                = var.pusunsg
  location            = azurerm_resource_group.tf-vnetrg.location
  resource_group_name = azurerm_resource_group.tf-vnetrg.name
  tags                = local.commontags
}

##Private subnet NSG##
resource "azurerm_network_security_group" "tf-prsunsg" {
  name                = var.prsunsg
  location            = azurerm_resource_group.tf-vnetrg.location
  resource_group_name = azurerm_resource_group.tf-vnetrg.name
  tags                = local.commontags
}

##Public subnet NSG Association##
resource "azurerm_subnet_network_security_group_association" "tf-pusunsgasso" {
  subnet_id                 = azurerm_subnet.tf-sbt01.id
  network_security_group_id = azurerm_network_security_group.tf-pusunsg.id
}

##Private subnet NSG Association##
resource "azurerm_subnet_network_security_group_association" "tf-prsunsgasso" {
  subnet_id                 = azurerm_subnet.tf-sbt02.id
  network_security_group_id = azurerm_network_security_group.tf-prsunsg.id
}

##Public NSG InBound Rule-300##
resource "azurerm_network_security_rule" "tf-nsgin300" {
  name                        = "AccessfrommyIP"
  priority                    = 300
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "3389"
  source_address_prefix       = "49.43.224.23/32"
  destination_address_prefix  = "10.1.0.4/32"
  resource_group_name         = azurerm_resource_group.tf-vnetrg.name
  network_security_group_name = azurerm_network_security_group.tf-pusunsg.name
}