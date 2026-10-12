variable "load_balancers" {
  type = map(object({
    name                    = string
    location                = string
    rg_name                 = string
    frontend_ip_config_name = string
    public_ip_name          = string
  }))
}