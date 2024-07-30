module "mod-rg" {
  source = "../..Resource_Group"
  rg     = var.rg

}

module "mod-nsg" {
  source     = "../../module/Network_Security_Group"
  nsg        = var.nsg
  security   = var.security_rules
  depends_on = [module.mod-rg]
}

module "mod-vnet" {
  source     = "../../module/Virtual_Network"
  vnet       = var.vnet
  depends_on = [module.mod-rg, module.mod-nsg]

}

module "mod-subnet" {
  source     = "../../module/Subnet"
  subnet     = var.subnet
  depends_on = [module.mod-vnet]

}

module "mod-pip" {
  source     = "../../module/Public_IP"
  pip        = var.pip
  depends_on = [module.mod-rg, module.mod-subnet]
}

module "mod-nic" {
  source     = "../../module/Newtork_Interface"
  nic        = var.nic
  depends_on = [module.mod-pip]
}


module "mod-vm" {
  source     = "../../module/Virtual_machine"
  vm         = var.vm
  depends_on = [module.mod-rg, module.mod-nic, module.mod-kv]
}

module "mod-lb" {
  source     = "../../module/LoadBalancer"
  my_lb      = var.my_lb
  blb        = var.blb
  blip       = var.blip
  depends_on = [module.mod-vm]
}


module "mod-kv" {
  source     = "../../module/KeyVault"
  secret = var.secret
  depends_on = [module.mod-rg]
}

module "mod-bastion" {
  source       = "../../module/Bastion"
  bastion-host = var.bastion-host
  depends_on   = [module.mod-subnet, module.mod-pip]
}