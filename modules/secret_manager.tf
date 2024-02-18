resource "google_secret_manager_secret" "secret_hasura_graphql_admin_secret" {
  secret_id = "HASURA_GRAPHQL_ADMIN_SECRET"
  replication {
    auto {}
  }
}

// https://registry.terraform.io/providers/hashicorp/google/latest/docs/guides/version_5_upgrade#replicationautomatic-is-now-removed

resource "google_secret_manager_secret_version" "secret_hasura_graphql_admin_secret" {
  secret      = google_secret_manager_secret.secret_hasura_graphql_admin_secret.name
  secret_data = random_password.hasura_admin_secret.result
}

resource "random_password" "hasura_admin_secret" {
  length           = 20
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
}

data "google_secret_manager_secret" "secret_hasura_graphql_metadata_database_url" {
  secret_id = "HASURA_GRAPHQL_METADATA_DATABASE_URL"
}

data "google_secret_manager_secret" "secret_pg_database_url" {
  secret_id = "PG_DATABASE_URL"
}

data "google_secret_manager_secret" "secret_hasura_graphql_jwt_secret" {
  secret_id = "HASURA_GRAPHQL_JWT_SECRET"
}
