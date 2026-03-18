terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}
terraform {
  backend "azurerm" {
    resource_group_name  = "terraform-mgmt-rg"
    storage_account_name = "productionstorage2026"
    container_name       = "tfstate"
    key                  = "main-app.tfstate"
  }
}
provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}