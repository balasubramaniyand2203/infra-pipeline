terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0" # Or your preferred version
    }
  }
}

provider "azurerm" {
  # This block is MANDATORY for the Azure provider
  features {} 
  
  # Optional: Hardcode your subscription if you still see 404 errors
  # subscription_id = "51ec4a85-5253-4bcf-92c2-0712c8410a66"
}
