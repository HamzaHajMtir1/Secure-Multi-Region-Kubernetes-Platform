resource "azurerm_resource_group" "rg" {
  name     = "rg-platform-${var.environment}"
  location = var.region
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = "aks-${var.environment}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "aks-${var.environment}"

  kubernetes_version = "1.36.0"

  default_node_pool {
    name       = "default"
    node_count = var.node_count
    vm_size    = "Standard_B2s_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  oidc_issuer_enabled = true

  tags = {
    environment = var.environment
  }
}

resource "azurerm_container_registry" "acr" {
  name                = "acrplatform${var.environment}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku                 = "Standard"
}

resource "azurerm_role_assignment" "aks_acr_pull" {
  scope                = azurerm_container_registry.acr.id
  role_definition_name = "AcrPull"
  principal_id         = azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id
}

resource "azurerm_postgresql_flexible_server" "db" {
  name                   = "psql-platform-${var.environment}"
  resource_group_name    = azurerm_resource_group.rg.name
  location               = azurerm_resource_group.rg.location
  sku_name               = "B_Standard_B1ms"
  storage_mb             = 32768
  version                = "16"
  administrator_login    = "pgadmin"
  administrator_password = var.db_password

  zone = "1"
}

resource "azurerm_key_vault" "kv" {
  name                = "kv-platform-${var.environment}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku_name            = "standard"
  tenant_id           = data.azurerm_client_config.current.tenant_id
}

data "azurerm_client_config" "current" {}