data "azurerm_public_ip" "name" {
    for_each = var.nic
    name = each.value.public_ip_address_id
    resource_group_name = each.value.resource_group_name
    }
  
data "azurerm_subnet" "name" {
    for_each = var.nic
    name = each.value.subnet_id
    virtual_network_name = each.value.virtual_network_name
    resource_group_name = each.value.resource_group_name
    }


resource "azurerm_network_interface" "name" {
    for_each = var.nic
    name = each.value.name
    location = each.value.location
    resource_group_name = each.value.resource_group_name
    ip_configuration {
        name = each.value.ip_configuration_name
        subnet_id = data.azurerm_subnet.name[each.key].id
        private_ip_address_allocation = each.value.private_ip_address_allocation
        public_ip_address_id = data.azurerm_public_ip.name[each.key].id
        }
    }