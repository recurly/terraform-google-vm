/**
 * Copyright 2018 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

output "policy" {
  description = "Resource snapshot policy details"
  value       = google_compute_resource_policy.policy
}

// not using this zonal policy attachment
// output "attachments" {
//   description = "Disk attachments to the resource policy"
//   value       = google_compute_disk_resource_policy_attachment.attachment.*
// }

output "attachments" {
  description = "Disk attachments to the resource policy"
  value       = google_compute_region_disk_resource_policy_attachment.attachment.*
}
