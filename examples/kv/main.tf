data "azurerm_app_configuration" "example" {
  name                = "appcs-existing-dev-usnc"
  resource_group_name = "rg-existing-dev-usnc"
}

module "kv" {
  source  = "TaleLearnCode/app_configuration_key/azurerm"
  version = "0.0.1-pre"
  providers = {
    azurerm = azurerm
  }

  configuration_store_id = data.azurerm_app_configuration.example.id
  type                   = "kv"
  key                    = "my-key"
  value                  = "my-value"
  label                  = "my-label"
}