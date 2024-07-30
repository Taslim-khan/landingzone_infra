rg = {
  rg1 = {
    name     = "new-rg"
    location = "west europe"
  }
}

#  Create Network Security Group

nsg = {
  nsg1 = {
    name = "new-nsg"
  }

}
security_rules = {
  rules1 = {
    name              = "test1"
    priority          = 100
    source_port_range = "22"
  }
  rules2 = {
    name              = "test2"
    priority          = 101
    source_port_range = "80"
  }
}

vnet = {
  vnet1 = {
    name = "new-vnet"
  }
}

subnet = {
  subnet1 = {
    name             = "new-subnet1"
    address_prefixes = "10.0.1.0/24"
  }
  subnet2 = {
    name             = "new-subnet2"
    address_prefixes = "10.0.2.0/24"
  }

  subnet3 = {
    name             = "AzureBastionSubnet"
    address_prefixes = "10.0.3.0/24"
  }
}

pip = {
  pip1 = {
    name = "new-pip1"
  }

  pip2 = {
    name = "bastion-pip"
  }
}

nic = {
  nic1 = {
    name  = "new-nic1"
    sname = "new-subnet1"
    #pipname = "lb-pip1"


    ip_configuration = {
      name = "configtest1"

    }
  }
  nic2 = {
    name  = "new-nic2"
    sname = "new-subnet2"
    #pipname = "lb-pip2"


    ip_configuration = {
      name = "configtest2"

    }
  }
}



vm = {
  vm1 = {
    name    = "new-vm1"
    user    = "adminuser"
    nicname = "new-nic1"
  }
  vm2 = {
    name    = "new-vm2"
    user    = "adminuser"
    nicname = "new-nic2"
  }
}

my_lb = "my_loadbalancer"
blb   = "my_backendpool"
blip = {
  blip1 = {
    name = "backend_pool_vm1"
    vm   = "new-vm1"
  }
  blip2 = {
    name = "backend_pool_vm2"
    vm   = "new-vm2"
  }
}

secret = {
  rule1 = {
    name  = "username"
    value = "manojkumar"
  }
  rule2 = {
    name  = "password"
    value = "Terraform@12345"
  }

}

bastion-host = "bastion_host"