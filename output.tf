output "network-rg-name" {
  value = module.resource_group4783.network-rg-name
}

output "network-rg-location" {
  value = module.resource_group4783.network-rg-location
}

output "azurerm_subnet_name" {
  value = module.network-4783.azurerm_subnet_name
}

output "virtual_network_name" {
  value = module.network-4783.virtual_network_name.name
}

output "VirtualNetwork-Sapce" {
  value = module.network-4783.virtual_network_name.address_space
}

output "network_security_group_name1" {
  value = module.network-4783.network_security_group_name1.name
}
output "log_analytics_workspace_name" {
  value = module.common-4783.log_analytics_workspace_name.name
}
output "recovery_vault_name" {
  value = module.common-4783.recovery_vault_name.name
}
output "storage_account_name" {
  value = module.common-4783.storage_account_name.name
}
output "linux-vm-private-ip" {
  value = module.vmlinux-4783.linux-vm-private-ip
}
output "linux-vm-public-ip" {
  value = module.vmlinux-4783.linux-vm-public-ip
}
output "linux_virtual_machine" {
  value = module.vmlinux-4783.linux_virtual_machine
}
output "linux-vm-hostname" {
  value = module.vmlinux-4783.linux-vm-hostname
}
output "windows_vm_name" {
  description = "Name of the Windows virtual machine"
  value       = module.vmwindows-4783.windows_vm_name
  sensitive   = true
}
output "windows_vm_id" {
  value = module.vmwindows-4783.windows_vm_id
}

output "windows_vm_dns_labels" {
  description = "DNS label for the Windows virtual machine"
  value       = module.vmwindows-4783.windows_vm_dns_label
}

output "windows_vm_private_ip_address" {
  description = "Private IP address for the Windows virtual machine"
  value       = module.vmwindows-4783.windows_vm_private_ip_address
}

output "windows_vm_public_ip_address" {
  description = "Public IP address for the Windows virtual machine"
  value       = module.vmwindows-4783.windows_vm_public_ip_address
}


