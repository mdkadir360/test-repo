module "rg" {
  source = "../../Module/RG"
  rg     = var.rg
}
module "vnet" {
  source = "../../Module/VNET"
  vnet   = var.vnet
}
module "nic" {
  source = "../../Module/NIC"
  nic    = var.nic
}

module "pip" {
  source = "../../Module/PIP"
  pip    = var.pip
}
module "vm" {
  source = "../../Module/VM"
  vm     = var.vm
}
module "subnet" {
  source = "../../Module/Subnet"
  subnet = var.subnet
}
module "nsg" {
  source = "../../Module/NSG"
  nsg    = var.nsg
  rule   = var.rule
}
module "association" {
  source      = "../../Module/Association"
  association = var.association
}
