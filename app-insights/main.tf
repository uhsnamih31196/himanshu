data "azurerm_resource_group" "rg"{
     for_each = var.appInsights
     name = each.value["rg_name"]

}

resource "azurerm_application_insights" "app-insights"{
    for_each  =  var.appInsights
    application_type = each.value["application_type"]
    location = each.value["location"]
    name = each.value["name"]
    resource_group_name = data.azurerm_resource_group.rg[each.key].name
    daily_data_cap_in_gb = each.value["daily_data_cap_in_gb"]
}
