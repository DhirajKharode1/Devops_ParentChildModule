resource "azurerm_subnet" "subnet"{
    for_each = var.subnets
    name                 = each.value.name
    resource_group_name  = each.value.resource_group_name
    virtual_network_name = each.value.resource_virtual_network_name
    address_prefixes     = each.value.address_prefixes
}

// resource_group_name  = azurerm_resource_group.resource_group[each.key].name
//virtual_network_name = azurerm_virtual_network.virtual_network[each.key].name