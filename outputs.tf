output "namespaces_id" {
  description = "Map of id values across all namespaces, keyed the same as var.namespaces except keys with no id are omitted"
  value       = { for k, v in kubernetes_namespace.namespaces : k => v.id if v.id != null && length(v.id) > 0 }
}
output "namespaces_metadata" {
  description = "Map of metadata values across all namespaces, keyed the same as var.namespaces except keys with no metadata are omitted"
  value       = { for k, v in kubernetes_namespace.namespaces : k => one(v.metadata) if v.metadata != null && length(v.metadata) > 0 }
}
output "namespaces_wait_for_default_service_account" {
  description = "Map of wait_for_default_service_account values across all namespaces, keyed the same as var.namespaces except keys with no wait_for_default_service_account are omitted"
  value       = { for k, v in kubernetes_namespace.namespaces : k => v.wait_for_default_service_account if v.wait_for_default_service_account != null }
}

