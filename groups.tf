resource "okta_group" "engineering" {
  name        = "Engineering"
  description = "Engineering department users"
}

resource "okta_group" "it_admins" {
  name        = "IT Admins"
  description = "Privileged IT administrator accounts"
}

resource "okta_group" "contractors" {
  name        = "Contractors"
  description = "External contractor accounts"
}