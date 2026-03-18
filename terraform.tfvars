resource_group_name = "dev-bcc-rg"
location            = "South India"
subscription_id     = "51ec4a85-5253-4bcf-92c2-0712c8410a66"
vnet_name           = "dev-bcc-vnet"
address_space       = ["10.0.0.0/16"]
subnet_name         = "bcc-subnet"
subnet_prefix       = ["10.0.1.0/24"]
acr_name            = "bala123reg"
acr_sku             = "Basic"

# AKS Quota Fix
node_count          = 1
vm_size             = "Standard_D2s_v3"

# MySQL Settings
mysql_server_name                  = "my-mysql-server"
mysql_admin_username               = "mysqladmin"
mysql_administrator_login_password = "Password1234!"
mysql_version                      = "8.0.21"
mysql_sku_name                     = "B_Standard_B1ms"
mysql_storage_size_gb              = 20
mysql_backup_retention_days        = 7

storage_account_name = "productionstorage2026"
container_name       = "terraformstatefile"

firewall_rules = ["0.0.0.0/0"]