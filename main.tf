provider "azurerm" {
    features {}
}
resource "azurerm_resource_group" "rsgr" {
  name     = var.name_rg
  location = var.locations_code
}
resource "azurerm_storage_account" "stac" {
  name                     = var.name_stac
  resource_group_name      = azurerm_resource_group.rsgr.name
  location                 = azurerm_resource_group.rsgr.location
  account_tier             = "Standard"
  account_replication_type = var.name_replication
}
resource "azurerm_key_vault" "azkv" {
  name                        = var.name_keavult
  location                    = azurerm_resource_group.rsgr.location
  resource_group_name         = azurerm_resource_group.rsgr.name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = var.name_sku_kv
  
    access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

     key_permissions = [
      "Get",
    ]

    secret_permissions = [
      "Get",
    ]

    storage_permissions = [
      "Get",
]
}
}

