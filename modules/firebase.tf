resource "google_firebase_project" "default" {
  provider = google-beta

  project = var.project_id
}

resource "google_project_service" "default" {
  provider = google-beta
  project  = var.project_id
  for_each = toset([
    "identitytoolkit.googleapis.com",
  ])
  service = each.key

  disable_on_destroy = false
}

resource "google_identity_platform_config" "default" {
  provider = google-beta
  project  = var.project_id
}

resource "google_identity_platform_project_default_config" "default" {
  provider = google-beta
  project  = var.project_id
  sign_in {
    allow_duplicate_emails = false

    email {
      enabled           = true
      password_required = true
    }
  }

  depends_on = [
    google_identity_platform_config.default
  ]
}
