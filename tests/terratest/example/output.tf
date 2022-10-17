# output "test_vnet_id" {
#   value = module.subnet.virtual_network_name.id
# }

output "subnet_id" {
  description = "Id of the created subnet"
  value       = module.subnet.id
}

# output "subnet_names" {
#   description = "Names of the created subnet"
#   value       = module.subnet.subnet_name
# }
