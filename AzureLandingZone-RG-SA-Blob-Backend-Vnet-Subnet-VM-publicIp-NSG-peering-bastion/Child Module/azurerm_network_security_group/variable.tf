variable "nsg" {
    description = "Network Security Group for the Network"
    type = map(object({
        nsg_name = string
        rg_key = string
        security_rule_name = string
        direction = string
        access = string
        protocol = string
    }))
}

##########################################################################

variable "vm" {
  description = "Virtual Machine"
  type = map(object({
    vm_name                 = string
    vnet_key                = string
    rg_key                  = string
    nic_key                 = string
    vm_size                 = string
    publisher               = string
    offer                   = string
    sku                     = string
    os_disk_name            = string
    computer_name           = string
    admin_username          = string
    admin_password          = string
    os_disk_termination     = bool
    data_disk_termination   = bool
    os_profile_linux_config = bool

  }))
}

##############################################################################

variable "pip" {
  description = "Public Ip allocated to VM"
  type = map(object({
    pip_name = string
    rg_key   = string
    vnet_key = string
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