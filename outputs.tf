output "id" {
  description = "The ids of subnets created inside the newly created vNet"
  value       = azurerm_subnet.subnet.id
}

output "name" {
  description = "Subnet name."
  value       = azurerm_subnet.subnet.name
}

output "resource_group_name" {
  description = "Resource Group name in which the subnet is created in."
  value       = azurerm_subnet.subnet.resource_group_name
}

output "virtual_network_name" {
  description = "The name of the virtual network in which the subnet is created in."
  value       = azurerm_subnet.subnet.virtual_network_name
}

output "address_prefixes" {
  description = "The address prefixes for the subnet."
  value       = azurerm_subnet.subnet.address_prefixes
}
