module "azurerm_resource_group" {
  source = "../../Modules/azurerm_resource_group"
  rgs    = var.rgs
}

module "azurerm_virtual_network" {
  depends_on = [module.azurerm_resource_group]
  source     = "../../Modules/azurerm_virtual_network"
  vnets      = var.vnets
}

module "azurerm_subnet" {
  depends_on = [module.azurerm_virtual_network]
  source     = "../../Modules/azurerm_subnets"
  subnets    = var.subnets
}

module "azurerm_public_ip" {
  depends_on = [module.azurerm_resource_group]
  source     = "../../Modules/azurerm_public_ip"
  public_ips = var.public_ips
}

module "azurerm_network_interface_card" {
  depends_on         = [module.azurerm_subnet, module.azurerm_public_ip]
  source             = "../../Modules/azurerm_network_interface_card"
  network_interfaces = var.network_interfaces
}

module "azurerm_virtual_machine" {
  depends_on       = [module.azurerm_resource_group, module.azurerm_virtual_network, module.azurerm_subnet, module.azurerm_public_ip, module.azurerm_network_interface_card]
  source           = "../../Modules/azurerm_virtual_machine"
  virtual_machines = var.virtual_machines
}
module "azurerm_bastion" {
  depends_on = [module.azurerm_subnet, module.azurerm_public_ip]
  source = "../../Modules/azurerm_bastion"
  bastions = var.bastions
}