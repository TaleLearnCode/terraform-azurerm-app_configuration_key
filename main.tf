# #############################################################################
# Terraform Module: App Configuration Key
# #############################################################################

resource "azurerm_app_configuration_key" "target_kv" {
  count = var.type == "kv" ? 1 : 0
  type                   = var.type
  configuration_store_id = var.configuration_store_id
  key                    = var.key
  value                  = var.value
  label                  = var.label
  locked                 = var.locked
  lifecycle {
    precondition {
      condition = var.type != "kv" || (var.type == "kv" && var.value != null)
      error_message = "value must be provided when type is 'kv'."
    }
  }
}

resource "azurerm_app_configuration_key" "target_vault" {
  count = var.type == "vault" ? 1 : 0
  type                   = var.type
  configuration_store_id = var.configuration_store_id
  key                    = var.key
  vault_key_reference    = var.vault_key_reference
  label                  = var.label
  lifecycle {
    precondition {
      condition = var.type == var.type != "vault" || (var.type == "kv" && var.vault_key_reference != null)
      error_message = "vault_key_reference must be provided when type is 'kv'."
    }
  }
}