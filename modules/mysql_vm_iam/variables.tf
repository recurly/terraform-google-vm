variable "project_id" {
  type        = string
  description = "The GCP Project ID for the instances."
}

variable "service_account" {
  type        = string
  description = "Service account to be used for taking snapshots"
}

variable "iam_dba_email" {
  type        = string
  description = "IAM format of the DBA Group Email in Gsuite"
}

variable "instance_zones" {
  type        = list(string)
  description = "List of zones for each hostname. Legacy: prefer instance_zones_by_host."
  default     = null
}

variable "instance_hostnames" {
  type        = list(string)
  description = "List of hostnames. Legacy: prefer instance_zones_by_host keys."
  default     = null
}

variable "instance_zones_by_host" {
  type        = map(string)
  description = "Map of hostname to zone. Preferred over the instance_hostnames/instance_zones lists; takes precedence when both are provided."
  default     = null
}

variable "instance_ips_by_host" {
  type        = map(string)
  description = "Map of hostname to internal IP. Preferred over the instance_ips list; takes precedence when both are provided."
  default     = null
}

variable "instance_ips" {
  type        = list(string)
  description = "List of IP addresses"
  default     = []
}

variable "iap_accessor_iam" {
  type        = string
  description = "IAM Email of the group that can access the instances via IAP"
  default     = null
}
