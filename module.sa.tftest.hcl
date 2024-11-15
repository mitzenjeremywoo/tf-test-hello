run "resource-group-name-created-correctly" {
  
  variables {
    prefix = "test"
  }

 module {
    source = "./modules"
  }
    
  command = plan
  assert {
    condition     = output.resource_group_name == "myrg"
    error_message = "Resource group created is not expected"
  }
}

