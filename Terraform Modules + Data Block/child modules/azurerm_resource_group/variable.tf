variable "rgs" {
    description = "Resource Group for the Landing Zone Networking"
    type = map(object({
        rg_name = string
        location = string
        managed_by = string
        tags = map(string)

    }))
}