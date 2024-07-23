resource "azurerm_resource_group" "tf-vmrg" {
  name     = var.vmrgname
  location = var.ciregion
  tags     = local.commontags
}

resource "azurerm_resource_group" "tf-vnetrg" {
  name     = var.vnetrgname
  location = var.ciregion
  tags     = local.commontags
}
