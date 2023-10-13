# terraform-github-team
A Terraform Module for setting up a GitHub Team and its configurations 🪸🦚🧟‍♂️

### Setup
1. Add Required Provider
    ```terraform
    terraform {
      required_providers {
        github = {
          source  = "integrations/github"
          version = "~> 5.0"
        }
      }
    }
    
    # Configure the GitHub Provider
    provider "github" {}
    ```

2. Setup GitHub Token In ENV
    ```bash
    export GITHUB_TOKEN="your_github_token"
    ```
