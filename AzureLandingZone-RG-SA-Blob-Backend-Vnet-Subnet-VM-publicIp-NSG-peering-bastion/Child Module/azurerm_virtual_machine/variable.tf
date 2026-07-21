variable "linux_vm" {
  description = "Linux Virtual Machine"
  type = map(object({
    vm_name                         = string
    rg_key                          = string
    vnet_key                        = string
    size                            = string
    username                        = string
    password                        = string
    nic_key                         = string
    disable_password_authentication = bool
  }))
}

############################################################

variable "pip" {
  description = "Public Ip allocated to VM"
  type = map(object({
    pip_name = string
    rg_key   = string
    vnet_key = string
  }))
}

variable "lb_pip" {
  description = "Public IP allocated to Load Balancer"
  type = map(object({
    lb_pip_name = string
    rg_key      = string
    vnet_key    = string

  }))

}

###################################################################

variable "nic" {
  description = "Network Interface for VM"
  type = map(object({
    nic_name              = string
    vnet_key              = string
    rg_key                = string
    ip_configuration_name = string
    subnet_key            = string
  }))
}

####################################################################

variable "subnet" {
  description = "Subnet"
  type = map(object({
    subnet_name      = string
    rg_key           = string
    vnet_key         = string
    address_prefixes = list(string)
  }))
}

#############################################################

variable "vnet" {
  description = "Virtual Network"
  type = map(object({
    vnet_name     = string
    rg_key        = string
    vnet_location = string
    address_space = list(string)
  }))

}

##########################################################
variable "blob" {
  description = "Blob Container in Storage Account"
  type = map(object({
    blob_name = string
    stg_key   = string
  }))
}

#########################################################

variable "stg" {
  description = "Storage_account"
  type = map(object({
    stg_name                 = string
    rg_key                   = string
    location                 = string
    account_tier             = string
    account_replication_type = string
  }))
}

#######################################################

variable "rg" {
  description = "Resource Group"
  type = map(object({
    rg_name     = string
    rg_location = string
  }))
}