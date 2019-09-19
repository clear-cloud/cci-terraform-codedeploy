variable "orchestration" {}
variable "environment" {}

variable "deployment_config_name" {
  default = "CodeDeployDefault.OneAtATime"
}

variable "autoscaling_groups" {}

variable "compute_platform" {
  default = "Server"
}

variable "name" {}
