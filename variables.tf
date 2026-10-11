variable "namespaces" {
  description = <<EOT
Map of namespaces, attributes below
Required:
    - metadata (block):
        - annotations (optional)
        - generate_name (optional)
        - labels (optional)
        - name (optional)
Optional:
    - wait_for_default_service_account
    - timeouts (block):
        - delete (optional)
EOT

  type = map(object({
    wait_for_default_service_account = optional(bool)
    metadata = object({
      annotations   = optional(map(string))
      generate_name = optional(string)
      labels        = optional(map(string))
      name          = optional(string)
    })
    timeouts = optional(object({
      delete = optional(string)
    }))
  }))
}

