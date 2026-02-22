output "vm_public_ip" {
  value = azurerm_public_ip.pip.ip_address
  description = "IP pública de la máquina virtual"
}

output "ssh_private_key_file" {
  value       = tls_private_key.ssh_key.private_key_pem
  sensitive   = true
  description = "Clave privada SSH para acceder a la VM"
}

output "acr_login_server" {
  value = azurerm_container_registry.acr.login_server
  description = "URL del ACR"
}

output "acr_username" {
  value       = azurerm_container_registry.acr.admin_username
  sensitive   = true
  description = "Usuario administrador del ACR"
}

output "acr_password" {
  value       = azurerm_container_registry.acr.admin_password
  sensitive   = true
  description = "Contraseña del administrador del ACR"
}

output "aks_kube_config" {
  value     = azurerm_kubernetes_cluster.aks.kube_config_raw
  sensitive = true
  description = "Credenciales del cluster AKS"
}