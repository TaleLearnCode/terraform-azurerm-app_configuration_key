data "azurerm_app_configuration" "existing" {
  name                = "appcs-existing-dev-usnc"
  resource_group_name = "rg-existing-dev-usnc"
}

data "azurerm_key_vault" "existing" {
  name                = "mykeyvault"
  resource_group_name = "some-resource-group"
}

data "azurerm_key_vault_secret" "existing" {
  name         = "secret-sauce"
  key_vault_id = data.azurerm_key_vault.existing.id
}

module "kv" {
  source  = "TaleLearnCode/app_configuration_key/azurerm"
  version = "0.0.1-pre"
  providers = {
    azurerm = azurerm
  }

  configuration_store_id = data.azurerm_app_configuration.existing.id
  type                   = "vault"
  key                    = "my-key"
  vault_key_reference    = data.azurerm_key_vault_secret.existing.key_vault_secret_versionless_id
  label                  = "my-label"
}