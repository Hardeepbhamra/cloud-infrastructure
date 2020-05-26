#-----------------------------------------------------------------------
# 1. Setting General Variables values
#-----------------------------------------------------------------------

prefix = "test"

location = "westus"

resource_group_name = "test"

#-----------------------------------------------------------------------
# 2. Virtual Network Variables
#-----------------------------------------------------------------------
address_space = "10.0.0.0/16"

address_prefix = "10.0.1.0/24"

#-----------------------------------------------------------------------
# 3. Windows Virtual Machine Variables
#-----------------------------------------------------------------------
vm_size = "Standard_A4_v2"

publisher = "MicrosoftWindowsServer"

offer = "WindowsServer"

sku = "2016-DataCenter"

version = "latest"

computer_name = "web-1"

admin_username = "testadmin"

admin_password = "ADD YOUR OWN PASSWORD"
