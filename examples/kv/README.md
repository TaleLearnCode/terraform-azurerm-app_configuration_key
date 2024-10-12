# Example: Create Azure App Configuration Key/Value Pair

This module manages an Azure App Configuration key/value pair using the [azurerm](https://registry.terraform.io/providers/hashicorp/azurerm/latest) Terraform provider.  This example shows how to use the module to manage an App Configuration key/value pair.

## Example Usage

```hcl
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
```

You are specifying these values:

- **type**: The type of the App Configuration Key.
- **key**: The name of the App Configuration Key to create.
- **value**: The value of the App Configuration Key.
- **label**: The label of the App Configuration Key.