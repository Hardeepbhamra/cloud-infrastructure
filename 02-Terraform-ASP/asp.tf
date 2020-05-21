resource "azurerm_app_service_plan" "asp" {
  name                  = "asp-${count.index}"
  location              = "west europe"
  resource_group_name   = "test"
  count = 3

  sku {
      tier              = "Standard"
      size              = "S1"
  }
  tags {
      name = "asp-${count.index}"
  }
}
