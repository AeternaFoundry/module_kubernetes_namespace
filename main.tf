resource "kubernetes_namespace" "namespaces" {
  for_each = var.namespaces

  wait_for_default_service_account = each.value.wait_for_default_service_account

  metadata {
    annotations   = each.value.metadata.annotations
    generate_name = each.value.metadata.generate_name
    labels        = each.value.metadata.labels
    name          = each.value.metadata.name
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      delete = timeouts.value.delete
    }
  }
}

