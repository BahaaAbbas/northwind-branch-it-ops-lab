output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

output "subnet_cidr" {
  value = azurerm_subnet.workload.address_prefixes
}