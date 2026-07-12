terraform {
  backend "azurerm" {
    resource_group_name  = "rg-tfstate"
    storage_account_name = "sttfstateplatform6919"
    container_name       = "tfstate"
    key                  = "secondary.tfstate"
  }

    required_providers {
    azurerm = {
        source  = "hashicorp/azurerm"
        version = "~> 4.80"
    }
    }
}

provider "azurerm" {
  features {}
}