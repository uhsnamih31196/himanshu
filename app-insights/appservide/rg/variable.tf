variable "resource_groups_config" {
    description = "Resource group configuration"
    type = map(object({
        name = string
        location = string
    }))
}
