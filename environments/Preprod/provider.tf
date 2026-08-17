terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.1.0"

    }
  }
}


provider "azurerm" {
  subscription_id = "4a3da603-80ee-4a69-82ea-6d8c8e2df892"
  features {}
}