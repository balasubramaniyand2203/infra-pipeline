module "resource_group" {
  source              = "./modules/resource_group"
  resource_group_name = var.resource_group_name
  location            = var.location # <--- Add this line
}
module "vnet" {
  source              = "./modules/vnet"
  vnet_name           = var.vnet_name
  location            = var.location
  resource_group_name = module.resource_group.resource_group_name
  address_space       = var.vnet_address_space
  depends_on = [
    module.resource_group
  ]
}

module "subnet" {
  source               = "./modules/subnet"
  subnet_name          = var.subnet_name
  resource_group_name  = module.resource_group.resource_group_name
  virtual_network_name = module.vnet.vnet_name
  subnet_prefixes      = var.subnet_prefix
  depends_on = [
    module.resource_group,
    module.vnet
  ]
}

module "acr" {
  source            = "./modules/acr"
  acr_name          = var.acr_name
  acr_sku           = "Basic"
  acr_admin_enabled = false
  location          = module.resource_group.resource_group_location
  resource_group    = module.resource_group.resource_group_name
}

module "mysql_server" {
  source = "./modules/mysql"

  mysql_server_name                  = var.mysql_server_name
  mysql_admin_username               = var.mysql_admin_username
  mysql_administrator_login_password = var.mysql_administrator_login_password
  resource_group_name                = module.resource_group.resource_group_name
  location                           = var.location
  mysql_version                      = var.mysql_version
  mysql_sku_name                     = var.mysql_sku_name
  mysql_storage_size_gb              = var.mysql_storage_size_gb
  mysql_backup_retention_days        = var.mysql_backup_retention_days
  depends_on = [
    module.resource_group
  ]
}

module "aks" {
  source              = "./modules/aks"
  cluster_name        = var.cluster_name
  dns_prefix          = var.dns_prefix
  node_count          = var.node_count
  vm_size             = var.vm_size
  location            = var.location
  resource_group_name = var.resource_group_name
  vnet_subnet_id      = module.subnet.subnet_id
  
  # Passing the list variables
  address_space       = var.address_space
  firewall_rules      = var.firewall_rules
}

#module "storage" {
# source               = "./modules/storage"
#storage_account_name = var.storage_account_name
#resource_group_name  = module.resource_group.resource_group_name
#location             = var.location
#container_name       = var.container_name
#depends_on = [
# module.resource_group
#]
#}