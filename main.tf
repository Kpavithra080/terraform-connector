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
  name               = "gitconnector"  # Connector name
  type               = "Github"  # GitHub connector type
  url                = "https://github.com/Kpavithra080/terraform-connector"  # GitHub repo URL
  url_type           = "REPO"  # Type of URL (Repo)
  generate_webhook_url = true  # Optionally generate a webhook URL

  authentication {
    type = "Http"  # Authentication method
    spec {
      type = "UsernameToken"  # Authentication type (using username and token)
      spec {
        username = "Kpavithra080"  # GitHub username
        token_ref = "harnesssecret"  # Secret reference for GitHub token (stored in Harness Secret Manager)
      }
    }
  }

  execute_on_delegate   = false  # Do not execute on delegate
  proxy                 = false  # No proxy
  ignore_test_connection = false  # Do not ignore the test connection
}
