variable "appInsights" {
  description = "App Insights"
  type = map(
    object(
        {
            Name          = string
            resource_group_name = string 
            Location      = string
            application_type        = string
            daily_data_cap_in_gb           = string
        }
    )
  )
}
