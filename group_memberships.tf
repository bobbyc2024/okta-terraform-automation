resource "okta_group_memberships" "engineering" {
  group_id = okta_group.engineering.id

  users = [
    okta_user.goku.id,
    okta_user.vegeta.id
  ]
}

resource "okta_group_memberships" "it_admins" {
  group_id = okta_group.it_admins.id

  users = [
    okta_user.gojo.id
  ]
}

resource "okta_group_memberships" "contractors" {
  group_id = okta_group.contractors.id

  users = [
    okta_user.itachi.id
  ]
}