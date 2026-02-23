variable "location" {
  description = "Région Azure"
  type        = string
  default     = "Switzerland North"
}

variable "prefix" {
  description = "Préfixe utilisé pour nommer toutes les ressources"
  type        = string
  default     = "tp-azure"
}

variable "admin_username" {
  description = "Nom d'utilisateur administrateur des VMs"
  type        = string
  default     = "azureuser"
}

variable "ssh_public_key_path" {
  description = "Chemin vers la clé publique SSH"
  type        = string
  default     = "~/.ssh/id_rsa.pub"
}
