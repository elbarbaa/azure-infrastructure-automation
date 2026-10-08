output "resource_group_name" {
  description = "Name of the Azure Resource Group."
  value       = azurerm_resource_group.main.name
}

output "resource_group_location" {
  description = "Azure region of the Resource Group."
  value       = azurerm_resource_group.main.location
}

output "storage_account_name" {
  description = "Name of the Azure Storage Account."
  value       = azurerm_storage_account.main.name
}

output "storage_account_id" {
  description = "Resource ID of the Azure Storage Account."
  value       = azurerm_storage_account.main.id
}

output "blob_container_name" {
  description = "Name of the Blob Storage container."
  value       = azurerm_storage_container.data.name
}

output "blob_endpoint" {
  description = "Primary Blob Storage endpoint."
  value       = azurerm_storage_account.main.primary_blob_endpoint
}