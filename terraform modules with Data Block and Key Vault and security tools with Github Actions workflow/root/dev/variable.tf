variable "rgs" {
  description = "Resource Group created in Azure Landing Zone"
  type = map(object({
    rg_name    = string
    location   = string
    managed_by = string
    #tags       = string
  }))
}

variable "stgs" {
  description = "Storage Account created"
  type = map(object({
    stg_name                 = string
    rg_name                  = string
    location                 = string
    account_tier             = string
    account_replication_type = string
  }))
}

variable "blob" {
  description = "Blob_container for State File"
  type = map(object({
    blob_name     = string
    access_type   = string
    data_stg_name = string
    data_rg_name  = string
  }))

}

variable "vnets" {
  description = "Virtual Network for Azure Landing Zone"
  type = map(object({
    vnet_name     = string
    location      = string
    rg_name       = string
    address_space = list(string)
  }))

}

variable "snets" {
  description = "Subnets"
  type = map(object({
    snet_name        = string
    vnet_name        = string
    rg_name          = string
    address_prefixes = list(string)
  }))

}

variable "public_ip" {
  description = "Public Ip's in the Azure Landing Zone"
  type = map(object({
    pip_name          = string
    rg_name           = string
    location          = string
    allocation_method = string
  }))
}

variable "bastion" {
  description = "Azurer Bastion"
  type = map(object({
    bastion_name     = string
    location         = string
    rg_name          = string
    ip_config_name   = string
    data_subnet_name = string
    data_vnet_name   = string
    data_pip_name    = string
  }))

}

variable "nics" {
  description = "Network Interface"
  type = map(object({
    nic_name                      = string
    location                      = string
    rg_name                       = string
    ip_config_name                = string
    private_ip_address_allocation = string
    data_subnet_name              = string
    data_vnet_name                = string
    data_rg_name                  = string

  }))
}

variable "nsgs" {
  description = "Network Security Groups"
  type = map(object({
    nsg_name                   = string
    location                   = string
    rg_name                    = string
    rule_name                  = string
    priority                   = number
    direction                  = string
    access                     = string
    protocol                   = string
    source_port_range          = string
    destination_port_range     = string
    source_address_prefix      = string
    destination_address_prefix = string
  }))
}

variable "nsg_subnet_association" {
  description = "Network Security Group Subnet Association"
  type = map(object({
    subnet_name          = string
    virtual_network_name = string
    resource_group_name  = string
    nsg_name             = string
  }))

}

variable "key_vault" {
  description = "Key Vault configuration"

  type = map(object({
    key_vault_name = string
    location       = string
    rg_name        = string
    #tenant_id                  = string
    soft_delete_retention_days = number
    purge_protection_enabled   = bool
    sku_name                   = string
    admin_username             = string
    admin_password             = string
  }))

  #sensitive = true
}

variable "vms" {
  description = "Virtual machine configuration."
  type = map(object({
    vm_name  = string
    rg_name  = string
    location = string
    #admin_username = string
    #admin_password = string
    nic_name       = string
    key_vault_name = string

  }))
}

variable "load_balancers" {
  type = map(object({
    name                    = string
    location                = string
    rg_name                 = string
    frontend_ip_config_name = string
    public_ip_name          = string
  }))
}





