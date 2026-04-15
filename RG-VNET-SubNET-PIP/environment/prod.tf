module "rg-vaibhav" {
  source = "../modules/azurerm_resource_group"
  rg_name     = "prod-rg"
  rg_location = "eastus"
}

module "vnet-vaibhav" {
  depends_on = [module.rg-vaibhav]
  source     = "../modules/azurerm_virtual_network"
  virtual_network_name = "prod-vnet"
  rg_name              = "prod-rg"
  rg_location          = "eastus"

}

module "subnet1" {
  depends_on = [module.vnet-vaibhav]
  source     = "../modules/azurerm_subnet"
  subnet_name           = "prod-subnet"
  virtual_network_name  = "prod-vnet"
  rg_name               = "prod-rg"
  subnet_address_prefix = ["10.0.1.0/24"]
}

module "pip" {
  depends_on = [module.rg-vaibhav]
  source     = "../modules/azurerm_public_ip"
  public_ip_name = "prod-pip"
  rg_name        = "prod-rg"
  rg_location    = "eastus"
}