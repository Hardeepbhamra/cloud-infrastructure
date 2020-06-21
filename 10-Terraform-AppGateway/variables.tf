# #-----------------------------------------------------------------------
# # Common Variables
# #-----------------------------------------------------------------------
variable "appgateway_name"{}
variable "resource_group_name" {}
variable "location" {}

# #-----------------------------------------------------------------------
# # sku Variables
# #-----------------------------------------------------------------------
variable "sku_name" {}
variable "sku_tier" {}

# #-----------------------------------------------------------------------
# # Gateway Auto Scale Variables
# #-----------------------------------------------------------------------
variable "autoscale_min_capacity" {}
variable "autoscale_max_capacity" {}


# #-----------------------------------------------------------------------
# #  Gateway IP Configuration Variables
# #-----------------------------------------------------------------------
variable "gateway_ip_configuration_name" {}


# #-----------------------------------------------------------------------
# #  Frontend Port Configuration Variables
# #-----------------------------------------------------------------------
variable "frontend_port_name"{}
variable "frontend_port" {}

# #-----------------------------------------------------------------------
# #  Frontend IP Configuration Variables
# #-----------------------------------------------------------------------
variable "frontend_ip_configuration_name" {}


# #-----------------------------------------------------------------------
# #  Backend Address Pool Variables
# #-----------------------------------------------------------------------
variable "backend_address_pool_name" {}


# #-----------------------------------------------------------------------
# #  Backend Http Settings Variables
# #-----------------------------------------------------------------------
variable "backend_http_settings_name" {}
variable "backend_port"  {}
variable "backend_protocol"  {}
variable "request_timeout" {}
variable "cookied_based_affinity_value" {}
variable "path" {}


# #-----------------------------------------------------------------------
# #  Listeners Variables
# #-----------------------------------------------------------------------
variable "listener_name" {}
variable "listener_protocol" {}


# #-----------------------------------------------------------------------
# #  Request Routing Rule Variables
# #-----------------------------------------------------------------------
variable "request_routing_name" {}
variable "request_routing_rule_type" {}

# #-----------------------------------------------------------------------
# #  ssl cert Variables
# #-----------------------------------------------------------------------
variable "ssl_cert_name" {}
variable "ssl_cert_password" {}

# #-----------------------------------------------------------------------
# #  Virtual Network Variables
# #-----------------------------------------------------------------------
variable "virtual_network_name"{}
variable "address_space" {}
variable "frontend_subnet_name" {}
variable "frontend_subnet_prefix" {}

# #-----------------------------------------------------------------------
# # Public IP Address Variables
# #-----------------------------------------------------------------------
variable "frontend_gateway_public_ip_name" {}
variable "public_ip_allocation_method" {}
variable "public_ip_sku" {}