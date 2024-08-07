data "azurerm_resource_group" "rg"{
     for_each = var.appService
     name = each.value["rg_name"]

}

resource "azurerm_service_plan" "asp" {
  for_each = var.appService
  name                = each.value["Name"]
  resource_group_name = each.value["ResourceGroup"]
  location            = each.value["Location"]
  os_type             = each.value["OsType"]
  sku_name            = each.value["SKU"]
}

resource "azurerm_windows_web_app" "app" {
  for_each = var.appService
  name                = each.value["Name"]
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = azurerm_service_plan.asp.location
  service_plan_id     = azurerm_service_plan.asp.id

  app_settings = {


  }

  dynamic "site_config"{
    for_each each.value["site_config"] != null ? each.value["site_config"] : {}
    content {
      always_on = site_config.value["always_on"]
      ftps_state = site_config.value["ftps_state"]
      http2_enabled = site_config.value["http2_enabled"]
     
    }
  }
}
