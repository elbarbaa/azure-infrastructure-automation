variable "resource_group_name" {
  description = "Name of the Azure Resource Group."
  type        = string
  default     = "devops-iac-rg"
}

variable "location" {
  description = "Azure region where resources will be deployed."
  type        = string
  default     = "Canada Central"
}

variable "storage_account_name" {
  description = "Globally unique Azure Storage Account name. Use only lowercase letters and numbers."
  type        = string

  validation {
    condition     = can(regex("^[a-z0-9]{3,24}$", var.storage_account_name))
    error_message = "Storage account name must be 3-24 characters and contain only lowercase letters and numbers."
  }
}

variable "container_name" {
  description = "Name of the private Blob Storage container."
  type        = string
  default     = "data"
}

variable "environment" {
  description = "Deployment environment."
  type        = string
  default     = "dev"
}