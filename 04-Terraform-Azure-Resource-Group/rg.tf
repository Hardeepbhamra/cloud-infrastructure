resource "azurerm_resource_group" "test2" {
  name                  = "test2"
  location              = "west europe"

  tags {
      project = "sharing"
  }
}
