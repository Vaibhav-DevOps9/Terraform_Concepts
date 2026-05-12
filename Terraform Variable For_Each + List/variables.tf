variable "rg_name" {
  description = "Name of the resource group"
  type        = string
  default     = "rg-terraform001"
}

# variable "stg_name" {
#     description = "Name of the storage account"
#     type = string
#     default = "stgterraform01"
# }

variable "rg_name2" {
  type = list(string)
}