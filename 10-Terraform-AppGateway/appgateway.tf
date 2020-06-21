resource "azurerm_application_gateway" "test_appgateway" {
    name                    = "${var.appgateway_name}"
    resource_group_name     = "${var.resource_group_name}"
    location                = "${var.location}"


    sku {
       name         = "${var.sku_name}"
       tier         = "${var.sku_tier}"
    }

    autoscale_configuration {
        min_capacity    = "${var.autoscale_min_capacity}"
        max_capacity    = "${var.autoscale_max_capacity}"
    }

    gateway_ip_configuration {
        name        = "${var.gateway_ip_configuration_name}"
        subnet_id   = "${azurerm_subnet.test_subnet_frontend.id}"
    }

    frontend_port {
        name        = "${var.frontend_port_name}"
        port        = "${var.frontend_port}"
    }

    frontend_ip_configuration {
        name                    = "${var.frontend_ip_configuration_name}"
        public_ip_address_id    = "${azurerm_public_ip.test_public_ip.id}"
    }

    backend_address_pool {
        name = "${var.backend_address_pool_name}"
    }

    backend_http_settings {
        name                    = "${var.backend_http_settings_name}"
        cookie_based_affinity   = "${var.cookied_based_affinity_value}"
        path                    = "${var.path}"
        port                    = "${var.backend_port}"
        protocol                = "${var.backend_protocol}"
        request_timeout         = "${var.request_timeout}"
    }

    http_listener {
        name                            = "${var.listener_name}"
        frontend_ip_configuration_name  = "${var.frontend_ip_configuration_name}"
        frontend_port_name              = "${var.frontend_port_name}"
        protocol                        = "${var.listener_protocol}"
        ssl_certificate_name            = "${var.ssl_cert_name}"
    }

    request_routing_rule {
        name                        = "${var.request_routing_name}"
        rule_type                   = "${var.request_routing_rule_type}"
        http_listener_name          = "${var.listener_name}"
        backend_address_pool_name   = "${var.backend_address_pool_name}"
        backend_http_settings_name  = "${var.backend_http_settings_name}"
    }

    ssl_certificate {
        name        = "${var.ssl_cert_name}"
        data        = "${base64encode(file("test.pfx"))}"
        password    = "${var.ssl_cert_password}"
    }
}