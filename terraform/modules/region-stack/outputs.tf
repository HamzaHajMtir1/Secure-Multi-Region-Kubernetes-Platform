
output "aks_name" { value = azurerm_kubernetes_cluster.aks.name }
output "acr_login_server" { value = azurerm_container_registry.acr.login_server }
output "kv_name" { value = azurerm_key_vault.kv.name }
output "db_fqdn" { value = azurerm_postgresql_flexible_server.db.fqdn }