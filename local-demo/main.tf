terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.5"
    }
  }
}

resource "local_file" "terraform_demo" {
  filename = "${path.module}/terraform-created.txt"

  content = <<EOF
Terraform automation is working!

Environment: Okta IAM Automation Lab
Created using: Terraform
Purpose: Demonstrate Infrastructure as Code
EOF
}