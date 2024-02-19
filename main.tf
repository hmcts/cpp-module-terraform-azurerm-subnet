resource "azurerm_subnet" "subnet" {
  name                                           = var.subnet_name
  resource_group_name                            = var.core_resource_group_name
  virtual_network_name                           = var.virtual_network_name
  address_prefixes                               = var.subnet_address_prefixes
  enforce_private_link_endpoint_network_policies = var.subnet_enforce_private_link_endpoint_network_policies
  enforce_private_link_service_network_policies  = var.subnet_enforce_private_link_service_network_policies

  # service_endpoints    = ["Microsoft.Web","Microsoft.Storage","Microsoft.ContainerRegistry"]

  service_endpoints = var.service_endpoints
  # service_endpoint_policy_ids = var.service_endpoint_policy_ids

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
