variable "create_resource_group" {
  description = "Flag to create a new resource group."
  type        = bool
  default     = false
}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "location" {
  description = "The location of the storage account."
  type        = string
}

variable "storage_accounts" {
  description = "Map of storage accounts."
  type = map(object({
    name             = string
    account_tier     = string
    replication_type = string
    network_rules = optional(object({
      default_action = string
      ip_rules       = list(string)
      subnet_ids     = list(string)
    }))
  }))
}

variable "storage_containers" {
  description = "Map of storage containers."
  type = map(object({
    name                = string
    storage_account_key = string
    access_type         = string
  }))
  default = {}
}

variable "storage_fileshares" {
  description = "Map of storage file shares."
  type = map(object({
    name                = string
    storage_account_key = string
    quota               = number
  }))
  default = {}
}

variable "storage_tables" {
  description = "Map of storage tables."
  type = map(object({
    name                = string
    storage_account_key = string
  }))
  default = {}
}
