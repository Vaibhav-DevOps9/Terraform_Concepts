variable "pips" {
    description = "Public IP"
    type = map(object({
      pip_name = string
      rg_name = string
      allocation_method = string
      location = string
    })) 
  
}