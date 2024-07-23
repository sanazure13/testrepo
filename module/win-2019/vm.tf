resource "azurerm_public_ip" "tf-vmpubip" {
  name                = "${var.vmname}-pubip"
  location            = var.region
  resource_group_name = var.rgname
  allocation_method   = "Static"
}

resource "azurerm_network_interface" "tf-vmnic" {
  name                = "${var.vmname}-nic"
  location            = var.region
  resource_group_name = var.rgname

  ip_configuration {
    name                          = "${var.vmname}-priip"
    subnet_id                     = var.subid
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.tf-vmpubip.id
  }
}

resource "azurerm_windows_virtual_machine" "tf-vm" {
  name                = "${var.vmname}"
  location            = var.region
  resource_group_name = var.rgname
  size                = var.vmsize
  admin_username      = "adminuser"
  admin_password      = "P@$$w0rd1234!"
  network_interface_ids = [ azurerm_network_interface.tf-vmnic.id  ]

  os_disk {
    name                 = "${var.vmname}-OSDisk"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }

}

resource "azurerm_managed_disk" "tf-vmdd1" {
  name                 = "${var.vmname}-DD01"
  location            = var.region
  resource_group_name = var.rgname
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = var.ddsize
}

resource "azurerm_virtual_machine_data_disk_attachment" "tf-vmdd01attach" {
  managed_disk_id    = azurerm_managed_disk.tf-vmdd1.id
  virtual_machine_id = azurerm_windows_virtual_machine.tf-vm.id
  lun                = "1"
  caching            = "ReadWrite"
}
