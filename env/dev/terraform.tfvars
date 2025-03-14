rg = {
  rgs = {
    rg1 = {
      name     = "dev-rg"
      location = "eastus"
    }
  }
}

vnet = {
  vnets = {
    vnet1 = {
      name                = "dev-vnet"
      location            = "eastus"
      resource_group_name = "dev-rg"
      address_space       = ["10.0.0.0/16"]
    }
  }
}

subnet = {
  subnets = {
    subnet1 = {
      name                 = "dev-subnet"
      address_prefixes     = ["10.0.1.0/24"]
      virtual_network_name = "dev-vnet"
      resource_group_name  = "dev-rg"
} } }




pip = {
  pips = {
    pip1 = {
      name                = "dev-pip"
      location            = "eastus"
      resource_group_name = "dev-rg"
      allocation_method   = "Static"
    }
  }
}


nic = {
  nics = {
    nic1 = {
      name                          = "dev-nic"
      location                      = "eastus"
      resource_group_name           = "dev-rg"
      ip_configuration_name         = "dev-ip-config"
      private_ip_address_allocation = "Dynamic"
      subnet_id                     = "dev-subnet"
      virtual_network_name          = "dev-vnet"
      public_ip_address_id          = "dev-pip"
    }
  }
}

nsg = {
  nsgs = {
    nsg1 = {
      name                = "dev-nsg"
      location            = "eastus"
      resource_group_name = "dev-rg"
    }
  }
}

rule = {
  rules = {
    rule1 = {
      name                        = "dev-rule"
      priority                    = 100
      direction                   = "Inbound"
      access                      = "Allow"
      protocol                    = "Tcp"
      source_port_range           = "*"
      destination_port_range      = "80"
      source_address_prefix       = "*"
      destination_address_prefix  = "*"
      resource_group_name         = "dev-rg"
      network_security_group_name = "dev-nsg"
    }
  }
}


association = {
  associations = {
    association1 = {
      name                  = "dev-association"
      ip_configuration_name = "dev-ip-config"
      resource_group_name   = "dev-rg"
      nsgname               = "dev-nsg"
      subnatname            = "dev-subnet"
      virtual_network_name  = "dev-vnet"
    }
  }
}

vm = {
  vms = {
    vm1 = {
      name                = "dev-vm"
      location            = "eastus"
      resource_group_name = "dev-rg"
      vm_size             = "Standard_DS1_v2"
      nicname             = "dev-nic"
} } }