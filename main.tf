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
  name               = "mygitconnector" 
  url                = "https://github.com/Kpavithra080/terraform-connector"  # GitHub repo URL
  url_type           = "REPO"  
  generate_webhook_url = true  

  authentication {
    type = "Http"  
    spec {
      type = "UsernameToken"  
      spec {
        username = "Kpavithra080"  # GitHub username
        token_ref = "harnesssecret"  # Secret reference for GitHub token (stored in Harness Secret Manager)
      }
    }
  }

  execute_on_delegate   = false  
  proxy                 = false  
  ignore_test_connection = false  

}