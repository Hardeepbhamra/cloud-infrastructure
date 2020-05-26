#-----------------------------------------------------------------------
# 1. Creating Virutal Network for VM
#-----------------------------------------------------------------------

resource "azurerm_virtual_network" "main" {
  name                = "${var.prefix}-vnet"
  address_space       = ["${var.address_space}"]
  location            = "${var.location}"
  resource_group_name = "${var.resource_group_name}"
}

#-----------------------------------------------------------------------
# 2. Creating subnet inside Virutal Network
#-----------------------------------------------------------------------
resource "azurerm_subnet" "webserver" {
  name                 = "${var.prefix}-web-subnet-1"
  resource_group_name  = "${var.resource_group_name}"
  virtual_network_name = "${azurerm_virtual_network.main.name}"
  address_prefix       = "${var.address_prefix}"
}

#-----------------------------------------------------------------------
# 3. Creating Network Interface Card (nic)
#-----------------------------------------------------------------------
resource "azurerm_network_interface" "webserver-nic-1" {
  name                = "${var.prefix}-web-nic"
  location            = "${var.location}"
  resource_group_name = "${var.resource_group_name}"

  ip_configuration {
    name                          = "${var.prefix}-nic-config"
    subnet_id                     = "${azurerm_subnet.webserver.id}"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = "${azurerm_public_ip.web-server-ip.id}"
  }
}

#-----------------------------------------------------------------------
# 4. Creating Virtual Machine
#-----------------------------------------------------------------------
resource "azurerm_virtual_machine" "webserver" {
  name                = "${var.prefix}-web-vm"
  location            = "${var.location}"
  resource_group_name = "${var.resource_group_name}"

  #network interface ids should be list
  network_interface_ids = ["${azurerm_network_interface.webserver-nic-1.id}"]
  vm_size               = "${var.vm_size}"

  #Delete OS Disk automatically when deleting VM
  delete_os_disk_on_termination = true

  storage_image_reference {
    publisher = "${var.publisher}"
    offer     = "${var.offer}"
    sku       = "${var.sku}"
    version   = "${var.version}"
  }

  storage_os_disk {
    name              = "${var.prefix}-web-server-os-disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name  = "${var.computer_name}"
    admin_username = "${var.admin_username}"
    admin_password = "${var.admin_password}"
  }

  os_profile_windows_config {
    provision_vm_agent = "true"
  }

  tags {
    env = "test"
  }
}

#-----------------------------------------------------------------------
# 5. Create Public IP Address
#-----------------------------------------------------------------------
resource "azurerm_public_ip" "web-server-ip" {
  name                = "${var.prefix}-web-server-pip"
  location            = "${var.location}"
  resource_group_name = "${var.resource_group_name}"
  allocation_method   = "Static"

  tags {
    env = "test"
  }
}


#-----------------------------------------------------------------------
# 6. Create Azure Virtual Machine extension for IIS
#-----------------------------------------------------------------------
resource "azurerm_virtual_machine_extension" "iis" {
  name                 = "install-iis"
  virtual_machine_id   = "${azurerm_virtual_machine.webserver.id}"
  publisher            = "Microsoft.Compute"
  type                 = "CustomScriptExtension"
  type_handler_version = "1.9"

  settings = <<SETTINGS
  {
    "commandToExecute": "powershell Install-WindowsFeature -name Web-Server -IncludeAllSubFeature -IncludeManagementTools;"
  }
  SETTINGS

  depends_on = ["azurerm_virtual_machine.webserver"]
}
