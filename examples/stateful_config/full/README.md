# stateful-config-full

This is an example of how to use the stateful_config module to create a managed
instance group with stateful instances.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| distribution\_policy\_zones | The distribution policy, i.e. which zone(s) should instances be create in. Default is all zones in given region. | list(string) | `<list>` | no |
| project\_id | The GCP project to use for integration tests | string | n/a | yes |
| region | The GCP region to create and test resources in | string | `"us-central1"` | no |
| service\_account | Service account to attach to the instance. See https://www.terraform.io/docs/providers/google/r/compute_instance_template.html#service_account. | object | `"null"` | no |
| subnetwork | The subnetwork to host the compute instances in | string | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| instance\_names | The names of the stateful instances in the managed instance group |
| region | The GCP region to create and test resources in |
| self\_link | Self-link of the managed instance group |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->