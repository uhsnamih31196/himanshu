variable "appService" {
  description = "appService"
  type = map(
    object(
        {
            rg_name          = string
            service_plan_name = string 
            service_plan_rg      = string
             web_appName       = string
             SKU           = string
         site_config = map(object({
          always_on = optional(bool)
          ftps_state = optional(bool)
          http2_enabled = optional(bool)
          application_stack = map(object({
           current_stack = string
            dotnet_version = string
          }))
         }))    
        }
    )
  )
}
