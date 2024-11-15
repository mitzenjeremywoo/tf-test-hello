# Terraform Configuration with Provider Version
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.2 " # Specifies the version of the AzureRM provider (e.g., any 3.x version)
    }
  }

  backend "azurerm" {
    # resource_group_name  = "terraform-backend-rg"
    # storage_account_name = "terraformbackendsa" # Must be globally unique
    # container_name       = "tfstate"
    # key                  = "terraform.tfstate"
  }
  
  required_version = ">= 1.3.0" # Specifies the minimum Terraform version
}

# Required Providers
provider "azurerm" {
  features {}
}

# Resource Group
resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "australiaeast"
}

# Storage Account
resource "azurerm_storage_account" "example" {
  name                     = "examplestorageacct" # Must be globally unique
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  # Optional settings
  enable_https_traffic_only        = true
  access_tier                     = "Hot"  # or "Cool"
  allow_blob_public_access         = false
  min_tls_version                 = "TLS1_2"
  
  # Tags for resource organization
  tags = {
    environment = "Example"
    project     = "TerraformDemo"
  }
}
