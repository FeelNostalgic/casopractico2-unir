resource "local_file" "ansible_inventory" {
  content = templatefile("${path.module}/inventory.tmpl", {
    vm_ip        = azurerm_public_ip.pip.ip_address
    ansible_user = var.admin_username
    ssh_key_path = "./secrets/id_rsa"
  })
  filename = "${path.module}/../ansible/inventory.ini"
}

resource "local_sensitive_file" "ansible_credentials" {
  content = yamlencode({
    acr_login_server = azurerm_container_registry.acr.login_server
    acr_username     = azurerm_container_registry.acr.admin_username
    acr_password     = azurerm_container_registry.acr.admin_password
  })
  filename = "${path.module}/../ansible/secrets/credentials.yml"
}

resource "local_sensitive_file" "ssh_private_key" {
  content  = tls_private_key.ssh_key.private_key_pem
  filename = "${path.module}/../ansible/secrets/id_rsa"
}