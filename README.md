# Azure App Configuration Key Terraform Module

[![Changelog](https://img.shields.io/badge/changelog-release-green.svg)](CHANGELOG.md)

This module manages App Configuration Key using the [azurerm](https://registry.terraform.io/providers/hashicorp/azurerm/latest) Terraform provider.

## Providers

| Name    | Version |
| ------- | ------- |
| azurerm | ~> 4.1. |

## Modules

No Modules

## Resources

No resources.

## Usage

```hcl
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

For more detailed instructions on using this module: please refer to the appropriate example:

- [Key/Value](examples/kv/README.md)
- [Vault Reference](examples/vault/README.md)

## Inputs

| Name                   | Description                                                  | Type   | Default | Required |
| ---------------------- | ------------------------------------------------------------ | ------ | ------- | -------- |
| tags                   | A map of tags to apply to all resources.                     | map    | N/A     | no       |
| configuration_store_id | Identifier of the App Configuration store.                   | string | N/A     | yes      |
| type                   | The type of the App Configuration Key. It can either be `kv` (simple key/vault) or `vault` (where the value is a reference to a Key Vault secret). | string | kv      | no       |
| key                    | The name of the App Configuration Key to create.             | string | N/A     | yes      |
| value                  | The value of the App Configuration Key. This should only be set when the **type** is set to `kv`. | string | null    | no       |
| label                  | The label of the App Configuration Key.                      | string | null    | no       |
| vault_key_reference    | The identifier of the vault secret this App Configuration Key references to. This can only be set when **type** is set to `vault`. | string | null    | no       |
| locked                 | Should this App Configuration Key be locked to prevent changes? | bool   | false   | no       |

## Outputs

| Name                  | Description                          |
| --------------------- | ------------------------------------ |
| app_configuration_key | The resulting App Configuration Key. |

## Naming Guidelines

### App Configuration

| Guideline                       |                                                              |
| ------------------------------- | ------------------------------------------------------------ |
| Resource Type Identifier        | N/A                                                          |
| Scope                           | App Configuration store                                      |
| Max Overall Length              | 10 KB (combination size limit for a key-value), including all characters in the key, its value, and all associated optional attributes) |
| Allowed Component Name Length * | N/A                                                          |
| Valid Characters                | Any Unicode character except for `%`, and it cannot be `.` or `..` |
| Regex                           | N/A                                                          |
