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

resource "google_firebase_web_app" "default" {
  provider        = google-beta
  project         = var.project_id
  display_name    = "task_app"
  deletion_policy = "DELETE"

  depends_on = [google_firebase_project.default]
}
