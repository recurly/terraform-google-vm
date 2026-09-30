locals {
  host_zones = var.instance_zones_by_host != null ? var.instance_zones_by_host : zipmap(var.instance_hostnames, var.instance_zones)

  host_ips = var.iap_accessor_iam == null ? {} : (var.instance_ips_by_host != null ? var.instance_ips_by_host : zipmap(var.instance_hostnames, var.instance_ips))
}

resource "google_compute_instance_iam_member" "computeAdmin" {
  for_each      = local.host_zones
  project       = var.project_id
  zone          = each.value
  instance_name = each.key
  role          = "roles/compute.instanceAdmin.v1"
  member        = var.service_account
}

resource "google_compute_instance_iam_member" "osadmin" {
  for_each      = local.host_zones
  project       = var.project_id
  zone          = each.value
  instance_name = each.key
  role          = "roles/compute.osAdminLogin"
  member        = var.iam_dba_email
}

resource "google_iap_tunnel_iam_member" "iap_tunnel" {
  for_each = local.host_ips
  project  = var.project_id
  role     = "roles/iap.tunnelResourceAccessor"
  member   = var.iap_accessor_iam

  condition {
    title       = "iap_access_to_${each.key}"
    description = "IAP access to MySQL"
    expression  = "destination.ip == '${each.value}' && destination.port == 3306"
  }

  lifecycle {
    precondition {
      condition     = var.instance_ips_by_host == null || keys(var.instance_ips_by_host) == keys(local.host_zones)
      error_message = "instance_ips_by_host keys must match the instance_zones_by_host keys."
    }
  }
}

resource "google_compute_instance_iam_member" "instance_access" {
  for_each      = var.iap_accessor_iam == null ? {} : local.host_zones
  project       = var.project_id
  zone          = each.value
  instance_name = each.key
  role          = "roles/compute.instanceAdmin.v1"
  member        = var.iap_accessor_iam
}