rg = {
  rg1 = {
    name     = "rg1"
    location = "eastus"
  }
  rg2 = {
    name     = "rg2"
    location = "eastus"
  }
}


stg = {
  stg1 = {
    name                     = "stg126may2026"
    rg                       = "rg1"
    location                 = "central india"
    account_tier             = "Standard"
    account_replication_type = "LRS"
  }
  stg2 = {
    name                     = "stg226may2026"
    rg                       = "rg1"
    location                 = "west us"
    account_tier             = "Standard"
    account_replication_type = "LRS"
  }
}

blob_container = {
  bc1 = {
    name                = "vhds"
    storage_account_key = "stg1"
  }
  bc2 = {
    name                = "vhds2"
    storage_account_key = "stg1"
  }
}

vnet = {
  vnet1 = {
    name      = "vnet1"
    location  = "eastus"
    rg_name   = "rg1"
    add_space = ["10.0.0.0/16"]
  }
  vnet2 = {
    name      = "vnet2"
    location  = "eastus2"
    rg_name   = "rg2"
    add_space = ["10.1.0.0/16"]
  }
}

subnet = {
  "subnet1" = {
    name         = "sub1"
    rg_name      = "rg1"
    vnet_name    = "vnet1"
    add_prefixes = ["10.0.1.0/24"]
  }
  "subnet2" = {
    name         = "sub2"
    rg_name      = "rg2"
    vnet_name    = "vnet2"
    add_prefixes = ["10.1.1.0/24"]
  }
}
