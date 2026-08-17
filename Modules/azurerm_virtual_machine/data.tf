data "azurerm_subnet" "subnet" {
  for_each            = var.virtual_machines
  name                = each.value.subnet_name
  virtual_network_name = each.value.virtual_network_name
  resource_group_name = each.value.resource_group_name
}

data "azurerm_public_ip" "public_ip" {
  for_each            = var.virtual_machines
  name                = each.value.public_ip_name
  resource_group_name = each.value.resource_group_name
}

data "azurerm_network_interface" "nic" {
  for_each            = var.virtual_machines
  name                = each.value.network_interface_name
  resource_group_name = each.value.resource_group_name
}