output "glue_connections_id" {
  description = "Map of id values across all glue_connections, keyed the same as var.glue_connections"
  value       = { for k, v in aws_glue_connection.glue_connections : k => v.id if v.id != null && length(v.id) > 0 }
}
output "glue_connections_arn" {
  description = "Map of arn values across all glue_connections, keyed the same as var.glue_connections"
  value       = { for k, v in aws_glue_connection.glue_connections : k => v.arn if v.arn != null && length(v.arn) > 0 }
}
output "glue_connections_athena_properties" {
  description = "Map of athena_properties values across all glue_connections, keyed the same as var.glue_connections"
  value       = { for k, v in aws_glue_connection.glue_connections : k => v.athena_properties if v.athena_properties != null && length(v.athena_properties) > 0 }
  sensitive   = true
}
output "glue_connections_authentication_configuration" {
  description = "Map of authentication_configuration values across all glue_connections, keyed the same as var.glue_connections"
  value       = { for k, v in aws_glue_connection.glue_connections : k => one(v.authentication_configuration) if v.authentication_configuration != null && length(v.authentication_configuration) > 0 }
  sensitive   = true
}
output "glue_connections_catalog_id" {
  description = "Map of catalog_id values across all glue_connections, keyed the same as var.glue_connections"
  value       = { for k, v in aws_glue_connection.glue_connections : k => v.catalog_id if v.catalog_id != null && length(v.catalog_id) > 0 }
}
output "glue_connections_connection_properties" {
  description = "Map of connection_properties values across all glue_connections, keyed the same as var.glue_connections"
  value       = { for k, v in aws_glue_connection.glue_connections : k => v.connection_properties if v.connection_properties != null && length(v.connection_properties) > 0 }
  sensitive   = true
}
output "glue_connections_connection_type" {
  description = "Map of connection_type values across all glue_connections, keyed the same as var.glue_connections"
  value       = { for k, v in aws_glue_connection.glue_connections : k => v.connection_type if v.connection_type != null && length(v.connection_type) > 0 }
}
output "glue_connections_description" {
  description = "Map of description values across all glue_connections, keyed the same as var.glue_connections"
  value       = { for k, v in aws_glue_connection.glue_connections : k => v.description if v.description != null && length(v.description) > 0 }
}
output "glue_connections_match_criteria" {
  description = "Map of match_criteria values across all glue_connections, keyed the same as var.glue_connections"
  value       = { for k, v in aws_glue_connection.glue_connections : k => v.match_criteria if v.match_criteria != null && length(v.match_criteria) > 0 }
}
output "glue_connections_name" {
  description = "Map of name values across all glue_connections, keyed the same as var.glue_connections"
  value       = { for k, v in aws_glue_connection.glue_connections : k => v.name if v.name != null && length(v.name) > 0 }
}
output "glue_connections_physical_connection_requirements" {
  description = "Map of physical_connection_requirements values across all glue_connections, keyed the same as var.glue_connections"
  value       = { for k, v in aws_glue_connection.glue_connections : k => one(v.physical_connection_requirements) if v.physical_connection_requirements != null && length(v.physical_connection_requirements) > 0 }
}
output "glue_connections_region" {
  description = "Map of region values across all glue_connections, keyed the same as var.glue_connections"
  value       = { for k, v in aws_glue_connection.glue_connections : k => v.region if v.region != null && length(v.region) > 0 }
}
output "glue_connections_tags" {
  description = "Map of tags values across all glue_connections, keyed the same as var.glue_connections"
  value       = { for k, v in aws_glue_connection.glue_connections : k => v.tags if v.tags != null && length(v.tags) > 0 }
}
output "glue_connections_tags_all" {
  description = "Map of tags_all values across all glue_connections, keyed the same as var.glue_connections"
  value       = { for k, v in aws_glue_connection.glue_connections : k => v.tags_all if v.tags_all != null && length(v.tags_all) > 0 }
}

