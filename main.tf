terraform {
  required_providers {
    harness = {
      source = "harness/harness"
      version = "0.35.2"  
    }
  }
}

provider "harness" {
  api_key = var.harness_api_key
}

resource "harness_git_connector" "mygitconnector" {
  name                 = "mygitconnector"  
  identifier           = "mygitconnector"  
  description          = "" 
  account_identifier   = "_jMhMFzbSJqFP9Ak93S4eg"  
  org_identifier       = "default" 
  project_identifier   = "connector"  

  spec {
    url                  = "https://github.com/Kpavithra080/terraform-connector"  # GitHub repository URL
    type                 = "Repo" 

    authentication {
      type = "Http"  

      spec {
        type = "UsernameToken"  

        spec {
          username = "Kpavithra080"  
          token_ref = "harnesssecret" 
        }
      }
    }

    execute_on_delegate   = false  
    proxy                 = false  
    ignore_test_connection = false 
  }
}
