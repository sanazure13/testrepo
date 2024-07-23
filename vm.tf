module "vm01" {
  source = "./module/win-2019"
  vmname = "tstwvm01"
  region = azurerm_resource_group.tf-vmrg.location
  rgname = azurerm_resource_group.tf-vmrg.name
  subid  = azurerm_subnet.tf-sbt01.id
  vmsize = var.vmsize["bsmll24"]
  ddsize = "4"
}

module "vm02" {
  source = "./module/win-2019"
  vmname = "tstwvm02"
  region = azurerm_resource_group.tf-vmrg.location
  rgname = azurerm_resource_group.tf-vmrg.name
  subid  = azurerm_subnet.tf-sbt02.id
  vmsize = var.vmsize["bmed28"]
  ddsize = "8"
}