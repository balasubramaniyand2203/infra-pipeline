module "resource_group" {
  source = "git::https://github.com/balasubramaniyand2203/infra-module.git//resource_group?ref=main"
  resource_group_name = var.resource_group_name
  location            = var.location
}

module "vnet" {
  source = "git::https://github.com/balasubramaniyand2203/infra-module.git//vnet?ref=main"
  vnet_name           = var.vnet_name
  location            = var.location
  resource_group_name = module.resource_group.resource_group_name
  address_space       = var.vnet_address_space
  depends_on          = [module.resource_group]
}

module "subnet" {
  source = "git::https://github.com/balasubramaniyand2203/infra-module.git//subnet?ref=main"
  subnet_name          = var.subnet_name
  resource_group_name  = module.resource_group.resource_group_name
  virtual_network_name = module.vnet.vnet_name
  subnet_prefixes      = var.subnet_prefix
  depends_on           = [module.resource_group, module.vnet]
}

# --- FIX 1: Added missing 'source' for ACR ---
module "acr" {
  source            = "git::https://github.com/balasubramaniyand2203/infra-module.git//acr?ref=main"
  acr_name          = var.acr_name
  acr_sku           = "Basic"
  acr_admin_enabled = false
  location          = module.resource_group.resource_group_location
  resource_group    = module.resource_group.resource_group_name
}

module "mysql_server" {
  source = "git::https://github.com/balasubramaniyand2203/infra-module.git//mysql?ref=main"
  mysql_server_name                  = var.mysql_server_name
  mysql_admin_username               = var.mysql_admin_username
  mysql_administrator_login_password = var.mysql_administrator_login_password
  resource_group_name                = module.resource_group.resource_group_name
  location                           = var.location
  mysql_version                      = var.mysql_version
  mysql_sku_name                     = var.mysql_sku_name
  mysql_storage_size_gb              = var.mysql_storage_size_gb
  mysql_backup_retention_days        = var.mysql_backup_retention_days
  depends_on                         = [module.resource_group]
}

# --- FIX 2: Updated AKS source to GitHub ---
module "aks" {
  source              = "git::https://github.com/balasubramaniyand2203/infra-module.git//aks?ref=main"
  cluster_name        = var.cluster_name
  dns_prefix          = var.dns_prefix
  node_count          = var.node_count
  vm_size             = var.vm_size
  location            = var.location
  resource_group_name = var.resource_group_name
  vnet_subnet_id      = module.subnet.subnet_id
  
  address_space       = var.address_space
  firewall_rules      = var.firewall_rules
}
