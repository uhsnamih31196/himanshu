variable "appService" {
  description = "appService"
  type = map(
    object(
        {
            Name          = string
            ResourceGroup = string 
            Location      = string
             OsType       = string
             SKU           = string
         site_config = map(object({
          always_on = optional(bool)
          ftps_state = optional(bool)
          http2_enabled = optional(bool)
         }))    
        }
    )
  )
}
