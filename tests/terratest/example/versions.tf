# Pin exact version of azurerm provider from 3.17.0 up to 4.x
# This is to inform the pre-commit hook that this module must be using older version of the azurerm instead of latest
# So that we do not get errors due ot deprecated properties and other issues that can only be resolved by azurerm upgrade
# Simple upgrade is not possible because bunch of upstream repositories/pipelines that use this module are still on the old azurerm provider and upgrade in this module breaks them
# This version file needs to be present both here and within the tests directory because pre-commit hook will create tmp version lock files and complain in each place
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.17.0"
    }
  }
}
