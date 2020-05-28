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
resource "azurerm_network_interface" "webserver-nic" {
  count = 2
  name                = "${var.prefix}-web-nic-${count.index}"
  location            = "${var.location}"
  resource_group_name = "${var.resource_group_name}"

  ip_configuration {
    name                          = "${var.prefix}-nic-config"
    subnet_id                     = "${azurerm_subnet.webserver.id}"
    private_ip_address_allocation = "Dynamic"
  }
}

#-----------------------------------------------------------------------
# 4. Creating Availability Set
#-----------------------------------------------------------------------
resource "azurerm_availability_set" "web_av_set" {
  name                         = "web_av_set"
  location                     = "${var.location}"
  resource_group_name          = "${var.resource_group_name}"
  platform_fault_domain_count  = 2
  platform_update_domain_count = 2

  tags {
    env = "test"
  }
}

#-----------------------------------------------------------------------
# 5. Creating Virtual Machine
#-----------------------------------------------------------------------
resource "azurerm_virtual_machine" "webserver" {
  count               = 2
  name                = "${var.prefix}-web-vm-${count.index}"
  location            = "${var.location}"
  resource_group_name = "${var.resource_group_name}"
  availability_set_id = "${azurerm_availability_set.web_av_set.id}"
  #network interface ids should be list
  network_interface_ids = ["${element(azurerm_network_interface.webserver-nic.*.id, count.index)}"]
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
    name              = "${var.prefix}-web-server-os-disk-${count.index}"
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
  count = 2
  name                = "${var.prefix}-web-server-pip-${count.index}"
  location            = "${var.location}"
  resource_group_name = "${var.resource_group_name}"
  allocation_method   = "Static"

  tags {
    env = "test"
  }
}
