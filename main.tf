resource "azurerm_subnet" "subnet" {
  name                                          = var.subnet_name
  resource_group_name                           = var.core_resource_group_name
  virtual_network_name                          = var.virtual_network_name
  address_prefixes                              = var.subnet_address_prefixes
  private_endpoint_network_policies             = var.private_endpoint_network_policies
  private_link_service_network_policies_enabled = var.private_link_service_network_policies_enabled

  service_endpoints = var.service_endpoints

  dynamic "delegation" {
    for_each = var.delegation
    content {
      name = delegation.value.name
      service_delegation {
        name    = delegation.value.service_delegation_name
        actions = delegation.value.service_delegation_actions
      }
    }
  }

}
