resource "azurerm_service_plan" "servicePlan" {
  for_each            = var.servicePlan  
  name                = each.value["Name"]
  resource_group_name = each.value["ResourceGroup"]
  location            = each.value["Location"]
  os_type             = each.value["OsType"]
  sku_name            = each.value["SKU"]
}
