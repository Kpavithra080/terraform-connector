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

resource "harness_git_connector" "github_connector" {
  name                 = "github-connector"
  url                  = "https://github.com/Kpavithra080/terraform-connector.git"  # Your GitHub repository URL
  branch               = "main"  
  generate_webhook_url = false
  secret_manager_id    = harness_secret_manager.harnesssecret.id
  password_secret_id   = harness_encrypted_text.github_token.id  

  url_type             = "REPO"  
  username             = "Kpavithra080"
  
}
