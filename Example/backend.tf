terraform {
  backend "azurerm" {
    resource_group_name = "modular_tf_infra_state_rg"
    storage_account_name = "modulartfinfrastate"
    container_name = "modulartfinfrastatecontainer"
    key = "test/storage/modularinfrastorage.tfstate"  # Or any other key you prefer
  }
}