variable "managed_identities" {
  description = "managed identities"
  type = map(
    object(
        {
            Name          = string
            rg_name = string 
            Location      = string
            
        }
    )
  )
}
