resource "azurerm_subnet" "subnet" {
  count = length(var.subnet_names)
  name = var.subnet_names[count.index]
  resource_group_name = var.core_resource_group_name
  virtual_network_name = var.virtual_network_name
  address_prefixes = [var.subnet_address_prefixes[count.index]]
  enforce_private_link_endpoint_network_policies = lookup(var.subnet_enforce_private_link_endpoint_network_policies, var.subnet_names[count.index], false)
  
  service_endpoints    = ["Microsoft.Web","Microsoft.Storage","Microsoft.ContainerRegistry"]
}