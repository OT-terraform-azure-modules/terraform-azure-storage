resource "azurerm_resource_group" "storage_rg" {
  count    = var.create_resource_group ? 1 : 0
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_storage_account" "storage" {
  for_each = { for idx, sa in var.storage_accounts : idx => sa }

  name                     = each.value.name
  resource_group_name      = var.create_resource_group ? azurerm_resource_group.storage_rg[0].name : var.resource_group_name
  location                 = var.location
  account_tier             = each.value.account_tier
  account_replication_type = each.value.replication_type

  dynamic "network_rules" {
    for_each = each.value.network_rules != null ? [each.value.network_rules] : []
    content {
      default_action             = network_rules.value.default_action
      ip_rules                   = network_rules.value.ip_rules
      virtual_network_subnet_ids  = network_rules.value.subnet_ids
    }
  }
}

resource "azurerm_storage_container" "container" {
  for_each = { for key, container in var.storage_containers : key => container }

  name                  = each.value.name
  storage_account_name  = azurerm_storage_account.storage[each.value.storage_account_key].name
  container_access_type = each.value.access_type
}

resource "azurerm_storage_share" "fileshare" {
  for_each = { for key, fileshare in var.storage_fileshares : key => fileshare }

  name                 = each.value.name
  storage_account_name = azurerm_storage_account.storage[each.value.storage_account_key].name
  quota               = each.value.quota
}

resource "azurerm_storage_table" "table" {
  for_each = { for key, table in var.storage_tables : key => table }

  name                 = each.value.name
  storage_account_name = azurerm_storage_account.storage[each.value.storage_account_key].name
}
