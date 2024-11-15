
# Outputs
output "storage_account_name" {
  description = "The name of the storage account"
  value       = azurerm_storage_account.example.name
}

output "primary_blob_endpoint" {
  description = "The primary blob service endpoint for the storage account"
  value       = azurerm_storage_account.example.primary_blob_endpoint
}

output "resource_group_name" {
  description = "The name of the resource group"
  value       = azurerm_resource_group.example.name
}