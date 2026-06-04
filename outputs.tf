output "id" {
  description = "The ids of subnets created inside the newly created vNet"
  value       = length(azurerm_subnet.subnet) > 0 ? azurerm_subnet.subnet[0].id : null
}

output "name" {
  description = "Subnet name."
  value       = length(azurerm_subnet.subnet) > 0 ? azurerm_subnet.subnet[0].name : null
}

output "resource_group_name" {
  description = "Resource Group name in which the subnet is created in."
  value       = length(azurerm_subnet.subnet) > 0 ? azurerm_subnet.subnet[0].resource_group_name : null
}

output "virtual_network_name" {
  description = "The name of the virtual network in which the subnet is created in."
  value       = length(azurerm_subnet.subnet) > 0 ? azurerm_subnet.subnet[0].virtual_network_name : null
}

output "address_prefixes" {
  description = "The address prefixes for the subnet."
  value       = length(azurerm_subnet.subnet) > 0 ? azurerm_subnet.subnet[0].address_prefixes : null
}
