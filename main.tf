module "resource_group4783" {
  source   = "./modules/resource-group4783"
  rg-name  = "RG-N01514783"
  location = "canadacentral"
tags = local.tags
}
module "network-4783" {
  source     = "./modules/network-4783"
  rg-name    = module.resource_group4783.network-rg-name
  location   = module.resource_group4783.network-rg-location
  depends_on = [module.resource_group4783]
}

module "common-4783" {
  source    = "./modules/common-4783"
  rg-name    = module.resource_group4783.network-rg-name
  location   = module.resource_group4783.network-rg-location
  subnet_id = module.network-4783.azurerm_subnet_name
  tags = local.tags
  depends_on = [
    module.resource_group4783
  ]
}

module "vmlinux-4783" {
  source        = "./modules/vmlinux-4783"
  nb_count      = 3
  linux_vm_name = "linux-vm-4783"
  rg_name       = module.resource_group4783.network-rg-name
  location      = module.resource_group4783.network-rg-location
  subnet_id     = module.network-4783.azurerm_subnet_name.id
  depends_on = [
    module.resource_group4783,
    module.network-4783,
    module.common-4783
  ]
  storage_account_name = module.common-4783.storage_account_name.name
  storage_account_key  = module.common-4783.storage_account_key
  storage_act          = module.common-4783.storage_account_name
tags = local.tags
}

module "vmwindows-4783" {
  source          = "./modules/vmwindows-4783"
  windows_vm_name = "win-vmn01514783"
  rg_name              = module.resource_group4783.network-rg-name
  location             = module.resource_group4783.network-rg-location
  subnet_id            = module.network-4783.azurerm_subnet_name.id
  depends_on           = [module.common-4783, module.network-4783 ,module.resource_group4783]
  storage_account_name = module.common-4783.storage_account_name
tags = local.tags
}


module "datadisk-4783" {
  source       = "./modules/datadisk-4783"
  linux-vm-ids = module.vmlinux-4783.linux-vm-ids
  windows_vm_id = module.vmwindows-4783.windows_vm_id
  location   = module.resource_group4783.network-rg-location
  rg_name    = module.resource_group4783.network-rg-name
  depends_on = [module.resource_group4783, module.vmwindows-4783, module.vmlinux-4783]
  tags = local.tags
}

module "loadbalancer-4783" {
  source        = "./modules/loadbalancer-4783"
  rg_name       = module.resource_group4783.network-rg-name
  location      = module.resource_group4783.network-rg-location
  vm_public_ip  = module.vmlinux-4783.linux-vm-public-ip
  linux-nic-id  = module.vmlinux-4783.nic_id[0]
  nb_count      = "3"
  linux_vm_name = module.vmlinux-4783.linux-vm-hostname
  subnet_id     = module.network-4783.azurerm_subnet_name
  depends_on = [
    module.resource_group4783,
    module.vmlinux-4783,
  ]
  tags = local.tags
}

module "database-4783" {
  source                          = "./modules/database-4783"
  rg_name                         = module.resource_group4783.network-rg-name
  location                        = module.resource_group4783.network-rg-location
  depends_on = [
    module.resource_group4783
  ]
  tags                     = local.tags
}






