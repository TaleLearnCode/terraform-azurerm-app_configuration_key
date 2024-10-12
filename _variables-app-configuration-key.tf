# #############################################################################
# Variables: App Configuration Key
# #############################################################################

variable "configuration_store_id" {
  type        = string
  description = "The identifier of the App Configuration."
}

variable "type" {
  type        = string
  default     = "kv"
  description = "The type of the App Configuration Key. It can eitehr be 'kv' (simple key/valut) or 'vault' (where the value is a reference to a Key Vault secret). Defaults to 'kv'."
  validation {
    condition = contains(["kv", "vault"], var.type)
    error_message = "The type must be either 'kv' or 'vault'."
  }
}

variable "key" {
  type        = string
  description = "The name of the App Configuration Key to create."
}

variable "value" {
  type        = string
  default     = null
  description = "The vaule of the App Configuration Key. This should only be set when type is set to 'kv'."
}

variable "label" {
  type        = string
  default     = null
  description = "The label of the App Configuration Key."
}

variable "vault_key_reference" {
  type        = string
  default     = null
  description = "The identifier of the vault secret this App Configuration Key references to. This can only be set when 'type' is set to 'vault'."
}

variable "locked" {
  type        = bool
  default     = false
  description = "Should this App Configuration Key be Locked to prevent changes? Defaults to false."
}