# Okta Terraform Automation

A Terraform Infrastructure as Code (IaC) project demonstrating how Okta users, groups, and group memberships can be managed through code.

The goal is to automate repeatable IAM configuration instead of manually creating and managing identities through the Okta Admin Console.

## 🎯 What This Project Manages

The Terraform configuration defines:

- Okta user accounts
- Okta groups
- User-to-group memberships
- Secure Okta provider configuration

Current example environment:

```text
Engineering
├── Goku
└── Vegeta

IT Admins
└── Gojo

Contractors
└── Itachi
```

When connected to an Okta environment, Terraform can compare this desired configuration with the existing Okta configuration and determine what needs to be created or changed.

## 📁 Project Structure

```text
okta-terraform-automation/
│
├── main.tf
├── variables.tf
├── groups.tf
├── users.tf
├── group_memberships.tf
├── terraform.tfvars.example
├── .gitignore
├── .terraform.lock.hcl
├── README.md
│
└── local-demo/
    ├── main.tf
    └── terraform-created.txt
```

### What Each File Does

**`main.tf`**  
Configures Terraform and the Okta provider.

**`variables.tf`**  
Defines the variables required to connect Terraform to Okta while keeping credentials out of the main configuration.

**`groups.tf`**  
Defines the Okta groups Terraform should create.

**`users.tf`**  
Defines the Okta user accounts Terraform should create.

**`group_memberships.tf`**  
Defines which users should belong to each Okta group.

**`terraform.tfvars.example`**  
Provides an example of the variables required for a live Okta environment without containing real credentials.

**`.gitignore`**  
Prevents sensitive Terraform variable files, state files, and local provider files from being committed to GitHub.

**`.terraform.lock.hcl`**  
Records the provider versions selected by Terraform so installations remain consistent.

## 🛠️ Terraform Installation

This project uses the local Terraform CLI.

A Terraform Cloud/HCP Terraform account or paid Terraform subscription is **not required** to run this project locally.

### macOS with Homebrew

Check whether Homebrew is installed:

```bash
brew --version
```

Add the HashiCorp Homebrew repository:

```bash
brew tap hashicorp/tap
```

Install Terraform:

```bash
brew install hashicorp/tap/terraform
```

Verify the installation:

```bash
terraform version
```

## 🔐 Okta Configuration

The project uses the official Okta Terraform provider.

A live deployment requires access to an Okta environment and appropriate API credentials.

Create a local file:

```text
terraform.tfvars
```

Using `terraform.tfvars.example` as the template:

```hcl
okta_org_name  = "your-okta-org"
okta_base_url  = "okta.com"
okta_api_token = "your-api-token"
```

Never commit real credentials to GitHub.

`terraform.tfvars` is intentionally excluded through `.gitignore`.

## 🚀 Terraform Workflow

### 1. Initialize

```bash
terraform init
```

Downloads and initializes the required Terraform providers.

### 2. Format

```bash
terraform fmt
```

Automatically formats Terraform configuration files.

### 3. Validate

```bash
terraform validate
```

Checks that the Terraform configuration is syntactically valid and internally consistent.

### 4. Preview Changes

```bash
terraform plan
```

Terraform compares the desired configuration with the current infrastructure and displays the changes it intends to make.

For example:

```text
Plan: 4 to add, 0 to change, 0 to destroy.
```

### 5. Apply

```bash
terraform apply
```

Terraform displays the proposed changes and requests confirmation before applying them.

For a live Okta environment, this is where Terraform would create or modify the defined Okta resources.

## 🔄 Infrastructure as Code Workflow

```text
Terraform Configuration
          ↓
     terraform plan
          ↓
     Review Changes
          ↓
     terraform apply
          ↓
   Okta Terraform Provider
          ↓
        Okta API
          ↓
   Okta IAM Environment
     ├── Users
     ├── Groups
     └── Memberships
```

This allows IAM configuration to be documented, reviewed, version-controlled, and deployed consistently.

## 🧪 Local Terraform Demo

A small local demonstration is included in:

```text
local-demo/
```

This was used to verify the Terraform workflow without requiring an Okta environment.

The demo uses the HashiCorp Local provider to manage a text file.

The configuration:

```hcl
resource "local_file" "terraform_demo" {
  filename = "${path.module}/terraform-created.txt"

  content = <<EOF
Terraform automation is working!

Environment: Okta IAM Automation Lab
Created using: Terraform
Purpose: Demonstrate Infrastructure as Code
EOF
}
```

Running:

```bash
terraform init
terraform plan
terraform apply
```

results in Terraform creating:

```text
terraform-created.txt
```

This demonstrates the same core Terraform workflow that will be used to manage Okta resources.

## 🧠 Why Terraform for Okta?

Managing IAM configuration as code can provide several advantages:

- Repeatable configuration
- Version-controlled IAM changes
- Easier review of proposed changes
- Reduced manual configuration
- Consistent environments
- Auditable configuration history
- Automation opportunities

Instead of manually creating an Okta group and assigning users through the Admin Console, the desired configuration can be defined in Terraform and reviewed before deployment.

## 🔒 Security

This repository does not contain real Okta credentials.

The following files are excluded from Git:

```text
terraform.tfvars
*.auto.tfvars
*.tfstate
*.tfstate.*
.terraform/
```

Terraform state can contain sensitive infrastructure information and should be handled securely in real environments.

## 🚧 Future Improvements

When connected to an Okta development environment, this project can be expanded to include:

- Live user provisioning
- Group lifecycle management
- Application assignments
- Authentication policies
- MFA policies
- Administrative roles
- Additional group rules
- OAuth-based Okta authentication
- Terraform import of existing Okta resources
- CI/CD validation and deployment

## 🛠️ Technologies

- Terraform
- HashiCorp Terraform CLI
- Okta
- Okta Terraform Provider
- Infrastructure as Code
- Identity and Access Management
- Git / GitHub

## 🎯 Purpose

This project demonstrates how Terraform and Infrastructure as Code principles can be applied to Identity and Access Management.

The Okta configuration defines users, groups, and access relationships as code, while the included local demo provides a working example of Terraform's `init`, `plan`, and `apply` lifecycle.

The Okta resources are ready to be tested against a development environment when appropriate Okta access is available.
