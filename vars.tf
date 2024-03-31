variable "policies" {
  type        = list(string)
  default     = null
  description = "A list of HashiCorp Vault policies to attach to Azure Groups."
}

variable "mail_enabled" {
  type        = bool
  default     = null
  description = "Determines whether mapped Azure groups should be mailed enabled. Set to true if all groups should be mail enabled."
}

variable "security_enabled" {
  type        = bool
  default     = null
  description = "Determines whether mapped Azure groups should be security enabled. Set to true if all groups should be security enabled."
}

variable "mount_accessor" {
  type = string
  description = "The mount accessor of the auth method used for OIDC access"
}
