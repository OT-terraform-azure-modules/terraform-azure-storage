output "storage_account_names" {
  description = "List of created storage account names."
  value       = [for sa in azurerm_storage_account.storage : sa.name]
}

output "storage_container_names" {
  description = "List of created storage container names."
  value       = [for c in azurerm_storage_container.container : c.name]
}

output "storage_fileshare_names" {
  description = "List of created storage file share names."
  value       = [for fs in azurerm_storage_share.fileshare : fs.name]
}

output "storage_table_names" {
  description = "List of created storage table names."
  value       = [for t in azurerm_storage_table.table : t.name]
}
