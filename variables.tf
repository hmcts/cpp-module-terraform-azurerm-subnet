
variable "subnet_name" {
  description = "subnet name"
  type        = string
  default     = ""
}

variable "core_resource_group_name" {
  description = "The resource group name to be imported"
  type        = string
}

variable "route_table_name" {
  description = "The route table name"
  type        = string
  default     = ""
}

variable "virtual_network_name" {
  description = "The Vnet name to be imported"
  type        = string
}

variable "subnet_address_prefixes" {
  description = "The address prefix to use for the subnet."
  type        = list(string)
  default     = ["10.0.1.0/24"]
}

variable "subnet_enforce_private_link_endpoint_network_policies" {
  description = "subnet endpoint network policy"
  type        = bool
  default     = false
}

variable "service_endpoints" {
  description = <<EOT
The list of Service endpoints to associate with the subnet.
Possible values include:
* Microsoft.AzureActiveDirectory
* Microsoft.AzureCosmosDB
* Microsoft.ContainerRegistry
* Microsoft.EventHub
* Microsoft.KeyVault
* Microsoft.ServiceBus
* Microsoft.Sql
* Microsoft.Storage
* Microsoft.Web
EOT
  type        = list(string)
  default     = []
}

variable "service_endpoint_policy_ids" {
  description = "The list of IDs of Service Endpoint Policies to associate with the subnet."
  type        = list(string)
  default     = null
}

variable "deligations" {
  type = list(object({
    name                       = string
    service_deligation_name    = string
    service_deligation_actions = list(string)
  }))
  default = []
}
