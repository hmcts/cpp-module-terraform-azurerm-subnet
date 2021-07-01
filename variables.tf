
variable "subnet_names" {
  description = "subnet name"
  type        = list(string)
  default     = ["subnet1"]
}

variable "core_resource_group_name" {
  description = "The resource group name to be imported"
  type        = string
}

variable "route_table_name" {
  description = "The route table name"
  type = string
}

variable "virtual_network_name" {
  description = "The Vnet name to be imported"
  type = string
}

variable "subnet_address_prefixes" {
  description = "The address prefix to use for the subnet."
  type        = list(string)
  default     = ["10.0.1.0/24"]
}

variable "subnet_enforce_private_link_endpoint_network_policies" {
  description = "A map with key (string) `subnet name`, value (bool) `true` or `false` to indicate enable or disable network policies for the private link endpoint on the subnet. Default value is false."
  type        = map(bool)
  default     = {}
}

variable "tags" {
  description = "The tags to associate with your network and subnets."
  type        = map(string)

  default = {
    environment = "dev"
  }
}