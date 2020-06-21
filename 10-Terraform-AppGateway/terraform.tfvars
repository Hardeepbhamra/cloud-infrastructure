# #-----------------------------------------------------------------------
# # Common Variables Values
# #-----------------------------------------------------------------------
appgateway_name         = "test_appgateway"
resource_group_name     = "test"
location                = "westus"

# #-----------------------------------------------------------------------
# # sku Variables Values
# # Allowed values in name are (Standard_Small, Standard_Medium, Standard_Large
# # Standard_v2, WAF_Medium, WAF_Large and WAF_v2)
# # 
# # Allowed values in tier are (Standard, Standard_v2, WAF and WAF_v2)
# #
# # We will be setting auto scaling hence "Capacity" property is not defined. 
# #-----------------------------------------------------------------------
sku_name    = "WAF_v2"
sku_tier    = "WAF_v2"

# #-----------------------------------------------------------------------
# # Gateway Auto Scale Variables Values
# #-----------------------------------------------------------------------
autoscale_min_capacity = "2"
autoscale_max_capacity = "4"


# #-----------------------------------------------------------------------
# #  Gateway IP Configuration Variable values
# #-----------------------------------------------------------------------
gateway_ip_configuration_name = "test_gateway_ip_config"


# #-----------------------------------------------------------------------
# #  Frontend Port Configuration Variable values
# #-----------------------------------------------------------------------
frontend_port_name  = "test_443"
frontend_port       = "443"

# #-----------------------------------------------------------------------
# #  Frontend IP Configuration Variable values
# #-----------------------------------------------------------------------
frontend_ip_configuration_name = "test_frontend_ip_config"


# #-----------------------------------------------------------------------
# #  Backend Address Pool Variable values
# #-----------------------------------------------------------------------
backend_address_pool_name    = "test_backend_address_pool"
backend_port                 = "443"
backend_protocol             = "https"
request_timeout              = "20"
cookied_based_affinity_value = "Enabled"
path                         = "/"


# #-----------------------------------------------------------------------
# #  Listeners Variables Values
# #-----------------------------------------------------------------------
listener_name       = "test_listener_https"
listener_protocol   = "https"

# #-----------------------------------------------------------------------
# #  Backend Http Settings Variable values
# #-----------------------------------------------------------------------
backend_http_settings_name = "test_backend_http_settings"


# #-----------------------------------------------------------------------
# #  Request Routing Rule Variables
# #-----------------------------------------------------------------------
request_routing_name        = "test_routing_rule"
request_routing_rule_type   = "Basic"


# #-----------------------------------------------------------------------
# #  ssl cert Variables Values
# #-----------------------------------------------------------------------
ssl_cert_name = "test_ssl_cert"
ssl_cert_password = "secret"

# #-----------------------------------------------------------------------
# # Virtual Network Variables Values
# #-----------------------------------------------------------------------
virtual_network_name            = "test_vnet"
address_space                   = "172.16.0.0/16"
frontend_subnet_name            = "frontend_subnet"
frontend_subnet_prefix          = "172.16.1.0/24"

# #-----------------------------------------------------------------------
# # Public IP Address Variables Values
# #-----------------------------------------------------------------------
frontend_gateway_public_ip_name = "test_frontend_gateway_public_ip"
public_ip_allocation_method     = "Static"
public_ip_sku                   = "Standard"