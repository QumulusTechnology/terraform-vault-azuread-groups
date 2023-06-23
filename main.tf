locals {
  group_names = tolist(data.azuread_groups.groups.display_names)
  object_ids  = tolist(data.azuread_groups.groups.object_ids)

  azure_groups = zipmap(local.group_names, local.object_ids)

}

resource "vault_identity_group" "azure_groups" {
  for_each = local.azure_groups


  name     = each.key
  type     = "external"
  policies = var.policies
  external_policies = true

  metadata = {
    version = "1"
  }
}

resource "vault_identity_group_alias" "group-alias" {
  for_each = local.azure_groups

  name           = each.value
  mount_accessor = var.auth_method
  canonical_id   = vault_identity_group.azure_groups[each.key].id
}
