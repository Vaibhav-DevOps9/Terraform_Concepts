abc = {
  rg1 = {
    rg_name     = "rg-sonu"
    rg_location = "eastus"
  }
  rg2 = {
    rg_name     = "rg-titu"
    rg_location = "westus"
  }
  rg3 = {
    rg_name     = "rg-sweety"
    rg_location = "centralindia"
  }
}


stg = {
  stg1 = {
    stg_name        = "santastorage17may"
    rg_key          = "rg1"
    stg_replication = "LRS"
    stg_tier        = "Standard"
  }
  stg2 = {
    stg_name        = "bantastorage17may"
    rg_key          = "rg3"
    stg_replication = "GRS"
    stg_tier        = "Standard"
  }
}

containers = {
  container1 = {
    container_name = "my-container"
    stg_key        = "stg2"
  }
}