# ##############################################################################
# Output Variables
# ##############################################################################

output "app_configuration_key_kv" {
  value = length(azurerm_app_configuration_key.target_kv) > 0 ? azurerm_app_configuration_key.target_kv[0] : null
}

output "app_configuration_key_vault" {
  value = length(azurerm_app_configuration_key.target_vault) > 0 ? azurerm_app_configuration_key.target_vault[0] : null
}

output "app_configuration_key" {
  value = length(azurerm_app_configuration_key.target_kv) > 0 ? azurerm_app_configuration_key.target_kv[0] : (
            length(azurerm_app_configuration_key.target_vault) > 0 ? azurerm_app_configuration_key.target_vault[0] : null
          )
  description = "The resulting App Configuration Key."
}
