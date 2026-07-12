# terraform/environments/traffic-manager/main.tf
resource "azurerm_traffic_manager_profile" "tm" {
  name                   = "tm-platform"
  resource_group_name    = "rg-platform-primary"
  traffic_routing_method = "Priority"

  dns_config {
    relative_name = "platform-app-${random_id.suffix.hex}"
    ttl           = 30
  }

  monitor_config {
    protocol                     = "HTTP"
    port                         = 80
    path                         = "/health"
    interval_in_seconds          = 30
    timeout_in_seconds           = 10
    tolerated_number_of_failures = 2
  }
}

resource "random_id" "suffix" { byte_length = 4 }

resource "azurerm_traffic_manager_external_endpoint" "primary" {
  name       = "primary"
  profile_id = azurerm_traffic_manager_profile.tm.id
  target     = "4.165.244.158"
  priority   = 1
}

resource "azurerm_traffic_manager_external_endpoint" "secondary" {
  name       = "secondary"
  profile_id = azurerm_traffic_manager_profile.tm.id
  target     = "20.251.96.49"
  priority   = 2
}