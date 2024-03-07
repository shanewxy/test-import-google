locals {
  port = 3306
  hosts = [
    google_sql_database_instance.primary.first_ip_address
  ]

  endpoints = [
    for c in local.hosts : format("%s:%d", c, local.port)
  ]
}

output "connection" {
  description = "The connection, a string combined host and port, might be a comma separated string or a single string."
  value       = join(",", local.endpoints)
}

output "address" {
  description = "The address, a string only has host, might be a comma separated string or a single string."
  value       = join(",", local.hosts)
}

output "port" {
  description = "The port of the service."
  value       = local.port
}