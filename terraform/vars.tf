variable "location" {
  description = "Ubicación de los recursos en Azure"
  type        = string
  default     = "Sweden Central"
}

variable "rg_name" {
  type        = string
  description = "Nombre del grupo de recursos"
  default     = "rg-cp2"
}

variable "acr_name" {
  type    = string
  description = "Nombre del Azure Container Registry (ACR)"
  default = "cp2acrfran2026"
}

variable "vm_name" {
  type    = string
  description = "Nombre de la máquina virtual"
  default = "vm-app-cp2"
}

variable "admin_username" {
  type    = string
  description = "Nombre de usuario administrador para la máquina virtual"
  default = "azureuser"
}

variable "aks_name" {
  type        = string
  description = "Nombre del cluster AKS"
  default     = "aks-cp2"
}