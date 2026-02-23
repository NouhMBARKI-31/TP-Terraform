# Partie 2 — Outputs réseau
output "resource_group_id" {
  description = "ID du Resource Group"
  value       = azurerm_resource_group.rg.id
}

output "vnet_name" {
  description = "Nom du Virtual Network"
  value       = azurerm_virtual_network.vnet.name
}

output "subnet_id" {
  description = "ID du Subnet"
  value       = azurerm_subnet.subnet.id
}

# Partie 5 — Output Load Balancer
output "lb_public_ip" {
  description = "IP publique du Load Balancer — accès web via cette IP"
  value       = azurerm_public_ip.lb_pip.ip_address
}
