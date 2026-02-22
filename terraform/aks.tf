resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.aks_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = var.aks_name
  sku_tier            = "Standard"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_B2ls_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    environment = "casopractico2"
  }
}

resource "azurerm_role_assignment" "aks_acr_pull" {
  principal_id         = azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id # Usamos kubelet_identity para la descarga de imágenes
  role_definition_name = "AcrPull"
  scope                = azurerm_container_registry.acr.id
  
  skip_service_principal_aad_check = true
}