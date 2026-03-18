output "resource_group_id" {
  value = module.resource_group.resource_group_id
}

output "resource_group_location" {
  value = module.resource_group.resource_group_location
}

output "resource_group_name" {
  value = module.resource_group.resource_group_name
}

output "subscription_id" {
  value = var.subscription_id
}

output "vnet_name" {
  value = module.vnet.vnet_name
}

output "subnet_id" {
  value = module.subnet.subnet_id # ✅ This pulls from the module's output
}
output "acr_login_server" {
  value = module.acr.acr_login_server
}
output "acr_admin_username" {
  value = module.acr.acr_admin_username
}
output "acr_admin_password" {
  value     = module.acr.acr_admin_password
  sensitive = true
}

output "mysql_server_name" {
  value = module.mysql_server.mysql_server_name
}

output "kubernetes_cluster_name" {
  value = module.aks.aks_cluster_name
}

output "kubernetes_cluster_location" {
  value = module.aks.aks_cluster_location
}
output "kube-config" {
  value     = module.aks.kube_config
  sensitive = true
}

#output "final_storage_id" {
# Change from module.azure_storage.storage_account_id
# To match the module "storage" block in your main.tf
# value = module.storage.storage_account_id 
#}

#output "final_blob_endpoint" {
# CORRECT: module.<MODULE_NAME>.<OUTPUT_NAME>
#value = module.storage.primary_blob_endpoint
#}