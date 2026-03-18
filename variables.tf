# --- REGION & AUTH ---
variable "location" {
  description = "The Azure region where resources will be created."
  type        = string
  default     = "South India"
}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
  default     = "rg-bcc-terraform"
}

variable "subscription_id" {
  description = "The subscription ID to use for Azure resources."
  type        = string
}

# --- NETWORKING ---
variable "vnet_name" {
  description = "The name of the virtual network."
  type        = string
  default     = "dev-bcc-vnet"
}

variable "vnet_address_space" {
  description = "The address space for the virtual network"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "subnet_name" {
  description = "The name of the subnet"
  type        = string
}

variable "subnet_prefix" {
  description = "The address prefix for the subnet"
  type        = list(string)
  default     = ["10.0.1.0/24"]
}

variable "address_space" {
  description = "Address space required by the AKS module"
  type        = list(string)
}


# --- AKS CLUSTER ---
variable "cluster_name" {
  type    = string
  default = "dev-bcc-aks"
}

variable "dns_prefix" {
  type    = string
  default = "devaks"
}

variable "node_count" {
  type    = number
  # SET TO 1: This is the ONLY way to fit a 2-core VM into a 2 vCPU quota.
  default = 1 
}

variable "vm_size" {
  type    = string
  # SET TO D2s_v3: Azure requires at least 2 cores for the system pool.
  default = "Standard_D2s_v3" 
}

variable "vnet_subnet_id" {
  description = "The ID of the Subnet where the AKS nodes will reside."
  type        = string
  default     = ""
}

# --- CONTAINER REGISTRY ---
variable "acr_name" {
  type = string
}

variable "acr_sku" {
  type    = string
  default = "Basic"
}

variable "acr_admin_enabled" {
  type    = bool
  default = false
}

# --- STORAGE ---
variable "storage_account_name" {
  type = string
}

variable "container_name" {
  type = string
}

# --- DATABASE (MySQL) ---
variable "mysql_server_name" {
  type = string
}

variable "mysql_admin_username" {
  type = string
}

variable "mysql_administrator_login_password" {
  type      = string
  sensitive = true
}

variable "mysql_version" {
  type    = string
  default = "8.0.21"
}

variable "mysql_sku_name" {
  type    = string
  default = "GP_Standard_D2ds_v4"
}

variable "mysql_storage_size_gb" {
  type    = number
  default = 20
}

variable "mysql_backup_retention_days" {
  type    = number
  default = 7
}

# File: variables.tf (ROOT folder)
variable "firewall_rules" {
  type    = list(string) # Ensure this is NOT "string"
  default = []
}