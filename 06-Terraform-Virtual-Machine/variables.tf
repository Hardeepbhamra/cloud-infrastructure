#-----------------------------------------------------------------------
# 1. Setting General Variables
#-----------------------------------------------------------------------

variable "prefix" {
  description = "prefix to append to resource names"
}

variable "location" {
  description = "Azure Region where we will create the resources"
}

variable "resource_group_name" {
  description = "Azure Resource Group name where all resources would be created"
}

#-----------------------------------------------------------------------
# 2. Virtual Network Variables
#-----------------------------------------------------------------------
variable "address_space" {
  description = "Variable defining the address space to use"
}

variable "address_prefix" {
  description = "The subnet that you want to create within VNet"
}

#-----------------------------------------------------------------------
# 3. Windows Virtual Machine Variables
#-----------------------------------------------------------------------
variable "vm_size" {
  description = "The virtual machine size"
}


variable "publisher" {
  description = "The Publisher image e.g MicrosoftWindowsServer"
}

variable "offer" {
  description = "Type of server e.g WindowsServer"
}

variable "sku" {
  description = "sku to use e.g 2016"
}

variable "version" {
  description = "Version of sku"
}

variable "computer_name" {
  description = "The web server hostname"
}
variable "admin_username" {
  description = "The user name for login"
}

variable "admin_password" {
  description = "The user name password"
}


