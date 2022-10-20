
provider "azurerm" {
  features {}
}


resource "random_id" "rg_name" {
  byte_length = 8
}

resource "azurerm_resource_group" "test" {
  name     = "test-${random_id.rg_name.hex}-rg"
  location = var.location
}

resource "azurerm_network_security_group" "example" {
  name                = "example-security-group"
  location            = azurerm_resource_group.test.location
  resource_group_name = azurerm_resource_group.test.name
}

resource "azurerm_virtual_network" "vnet" {
  name                = "test_vnet"
  location            = var.vnet_location
  resource_group_name = azurerm_resource_group.test.name
  address_space       = ["10.0.0.0/16"]
  depends_on          = [azurerm_resource_group.test]
  subnet {
    name           = "subnet1"
    address_prefix = "10.0.1.0/24"
  }

  subnet {
    name           = "subnet2"
    address_prefix = "10.0.2.0/24"
    #security_group = azurerm_network_security_group.example.id
  }
}

module "subnet" {
  source                                                = "../../../"
  subnet_name                                           = "subnet3"
  core_resource_group_name                              = azurerm_resource_group.test.name
  virtual_network_name                                  = azurerm_virtual_network.vnet.name
  subnet_address_prefixes                               = ["10.0.10.0/24"]
  subnet_enforce_private_link_endpoint_network_policies = true
  depends_on                                            = [azurerm_virtual_network.vnet]
}
