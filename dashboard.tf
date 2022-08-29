resource "google_monitoring_dashboard" "dashboard" {
  dashboard_json = <<EOF
{
  "displayName": "pin-devops Dashboard",
  "gridLayout": {
    "widgets": [
      {
        "blank": {}
      }
    ]
  }
}

EOF
}
