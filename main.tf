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
<<<<<<< HEAD
=======
data "harness_secret" "my_secret" {
  secret_name = "harnesssecret"  # The name of the secret created in Harness
}


## Github connector ##

resource "harness_secret_manager" "my_secret_manager" {
  name = "my-secret-manager"
}
# Create a secret
resource "harness_encrypted_text" "github_token" {
  name              = "github-access-token"  
  value             = var.github_token  
  secret_manager_id = harness_secret_manager.my_secret_manager.id  
}

# Create a GitHub connector using the stored token
resource "harness_git_connector" "github_connector" {
  name                 = "github-connector"
  url                  = "https://github.com/Kpavithra080/terraform-connector.git"  
  branch               = "main"  
  generate_webhook_url = false
  secret_manager_id    = harness_secret_manager.my_secret_manager.id
  password_secret_id   = harness_encrypted_text.github_token.id 
  url_type             = "REPO"
  username             = "Kpavithra080"  
}

>>>>>>> 1b5cfdc (git connector)
