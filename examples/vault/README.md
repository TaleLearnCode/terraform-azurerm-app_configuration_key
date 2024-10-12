# Example: Create Azure App Configuration Vault Secret Reference

This module manages an Azure App Configuration vault secret reference using the [azurerm](https://registry.terraform.io/providers/hashicorp/azurerm/latest) Terraform provider.  This example shows how to use the module to manage an App Configuration with an Azure Key Vault secret reference.

## Example Usage

```hcl
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
  vault_key_reference    = data.azurerm_key_vault_secret.existing.versionless_id
  label                  = "my-label"
}
```

You are specifying these values:

- **type**: The type of the App Configuration Key.
- **key**: The name of the App Configuration Key to create.
- **vault_key_reference**: The identifier of the vault secret this App Configuration Key references to.
- **label**: The label of the App Configuration Key.
