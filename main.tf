resource "google_sql_database_instance" "primary" {
  database_version = "MYSQL_8_0_31"

  settings {
    tier = "db-f1-micro"

    #tfsec:ignore:google-sql-encrypt-in-transit-data
    ip_configuration {
      ipv4_enabled    = true
    }

    backup_configuration {
      enabled            = true
      binary_log_enabled = true
    }
  }

  deletion_protection = false
}
