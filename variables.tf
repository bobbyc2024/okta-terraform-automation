variable "okta_org_name" {
  description = "Okta organisation name"
  type        = string
}

variable "okta_base_url" {
  description = "Okta base URL"
  type        = string
  default     = "okta.com"
}

variable "okta_api_token" {
  description = "Okta API token used by Terraform"
  type        = string
  sensitive   = true
}