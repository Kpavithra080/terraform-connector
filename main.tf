terraform {
  required_providers {
    harness = {
      source = "harness/harness"
      version = "0.35.2"  
    }
  }
}

provider "harness" {
  platform_api_key = var.harness_api_key
}

resource "harness_platform_connector_github" "harnessgithub" {
  identifier  = "githubtesting"
  name        = "harnessgithub"
  description = "harnessgithub"
  tags        = ["foo:bar"]

  url                = "https://github.com/Kpavithra080"
  connection_type    = "Account"
  validation_repo    = "https://github.com/Kpavithra080/terraform-connector"
  credentials {
    http {
      username  = "Kpavithra080"
      token_ref = "harnesssecret.id"
    }
  }
}