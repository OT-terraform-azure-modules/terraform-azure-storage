module "storage" {
  source               = "../Storage"
  create_resource_group = var.create_resource_group
  resource_group_name  = var.resource_group_name
  location             = var.location
  storage_accounts     = var.storage_accounts
  storage_containers   = var.storage_containers
  storage_fileshares   = var.storage_fileshares
  storage_tables       = var.storage_tables
}
