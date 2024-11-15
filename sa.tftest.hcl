run "resource-group-name-created-correctly" {
  
  variables {
    prefix = "test"
  }
    
  command = plan
  assert {
    condition     = azurerm_resource_group.example.name == "myrg"
    error_message = "Resource group created is not expected"
  }
}

run "storage-account-prefix-created-correctly" {

  variables {
    prefix = "dev"
  }
  
  command = plan
  assert {
    condition     = azurerm_storage_account.example.name == "mytestdev"
    error_message = "Resource group created is not expected"
  }
}
