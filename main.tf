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
  name                 = "mygitconnector"  # Connector name
  identifier           = "gitconnector"  # Connector identifier (same as name in this case)
  description          = ""  # You can leave the description empty if not needed
  account_identifier   = "_jMhMFzbSJqFP9Ak93S4eg"  # The account identifier from Harness
  org_identifier       = "default"  # Organization identifier
  project_identifier   = "connector"  # Project identifier

  spec {
    url                  = "https://github.com/Kpavithra080/terraform-connector"  # GitHub repository URL
    type                 = "Repo"  # Git repository type

    authentication {
      type = "Http"  # HTTP authentication method

      spec {
        type = "UsernameToken"  # Authentication type

        spec {
          username = "Kpavithra080"  # GitHub username
          token_ref = "harnesssecret"  # Secret reference for GitHub token
        }
      }
    }

    execute_on_delegate   = false  # Do not execute on delegate
    proxy                 = false  # No proxy
    ignore_test_connection = false  # Test connection is not ignored
  }
}
