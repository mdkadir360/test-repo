module "rg" {
  source = "../../Module/RG"
  rg     = var.rg
}
module "vnet" {
  source = "../../Module/VNET"
  vnet   = var.vnet
  depends_on = [ module.rg ]
}
module "nic" {
  source = "../../Module/NIC"
  nic    = var.nic
  depends_on = [ module.pip, module.subnet ]
}

module "pip" {
  source = "../../Module/PIP"
  pip    = var.pip
  depends_on = [ module.rg ]
}
module "vm" {
  source = "../../Module/VM"
  vm     = var.vm
    depends_on = [ module.rg, module.nic,module.association ]
}
module "subnet" {
  source = "../../Module/SUBNET"
  subnet = var.subnet
    depends_on = [ module.vnet ]
}
module "nsg" {
  source = "../../Module/NSG"
  nsg    = var.nsg
  rule   = var.rule
    depends_on = [ module.nic ]
}
module "association" {
  source      = "../../Module/NSG-ASSOSIATION"
  association = var.association
    depends_on = [ module.nsg, module.subnet ]
}
