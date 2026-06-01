variable "rg" {
    description = "Map of resource groups to create. The key is the name of the resource group and the value is an object with the properties 'name' and 'location'."
    type = map(object({
        name     = string
        location = string
    }))
}