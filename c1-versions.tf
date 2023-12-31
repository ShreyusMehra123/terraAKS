#Terraform Block
terraform {
  required_version = ">=1.0.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=3.0"
    }
  }
  #Terraform State Storage to Azure Storage Container
  backend "azurerm" {
    resource_group_name  = "terraform-storage-rg"
    storage_account_name = "tftateleenaai"
    container_name       = "tfstatefiles"
    key                  = "terraformAks.tfstate"
  }
}

#Provider Block
provider "azurerm" {
  features {}
}