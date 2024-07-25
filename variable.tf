variable "servicePlan" {
  description = "Service Plan"
  type = map(
    object(
        {
            Name          = string
            ResourceGroup = string 
            Location      = string
            OsType        = string
            SKU           = string
        }
    )
  )
}
