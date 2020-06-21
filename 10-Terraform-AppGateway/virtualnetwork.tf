resource "azurerm_virtual_network" "test_vnet" {
    name                = "${var.virtual_network_name}"
    resource_group_name = "${var.resource_group_name}"
    location            = "${var.location}"
    address_space       = ["${var.address_space}"]
}

resource "azurerm_subnet" "test_subnet_frontend" {
    name                 = "${var.frontend_subnet_name}"
    resource_group_name  = "${var.resource_group_name}"
    virtual_network_name = "${azurerm_virtual_network.test_vnet.name}"
    address_prefix       = "${var.frontend_subnet_prefix}"
}

resource "azurerm_public_ip" "test_public_ip" {
    name                    = "${var.frontend_gateway_public_ip_name}"
    resource_group_name     = "${var.resource_group_name}"
    location                = "${var.location}"
    allocation_method       = "Static"
    sku                     = "Standard"
}