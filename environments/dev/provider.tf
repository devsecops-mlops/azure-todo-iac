terraform {
  required_version = ">= 1.5.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "rg-backend"
    storage_account_name = "aibasedtodo"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"

  }
}


provider "azurerm" {
  features {}
}
