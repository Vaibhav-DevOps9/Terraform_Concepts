variable "vms" {
  description = "Virtual machine configuration."
  type = map(object({
    vm_name  = string
    rg_name  = string
    location = string
    #admin_username = string
    #admin_password = string
    nic_name = string
    key_vault_name = string

  }))
}