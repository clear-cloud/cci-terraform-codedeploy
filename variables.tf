variable "orchestration" {}
variable "environment" {}

variable "autoscaling_groups" {}

variable "compute_platform" {
  default = "Server"
}

variable "name" {}

variable "lifecycle_rule_enabled" {
  description = "enable / disable default lifecycle rule"
  default     = "true"
}

variable "deployment_option" {
  description = "Indicates whether to route deployment traffic behind a load balancer."
  default     = "WITH_TRAFFIC_CONTROL"
}

variable "deployment_type" {
  description = "Indicates whether to run an in-place deployment or a blue/green deployment."
  default     = "IN_PLACE"
}

variable "action_on_timeout" {
  description = "When to reroute traffic from an original environment to a replacement environment in a blue/green deployment"
  default     = "CONTINUE_DEPLOYMENT"
}

variable "green_fleet_provisioning_option_action" {
  description = "The method used to add instances to a replacement environment"
  default     = "COPY_AUTO_SCALING_GROUP"
}

variable "terminate_blue_instances_on_deployment_success_action" {
  description = "The action to take on instances in the original environment after a successful blue/green deployment."
  default     = "TERMINATE"
}

variable "listener_name" {
  description = "Listener name"
  default     = ""
}

variable "deployment_config_name" {
  description = "Deployment config Name"
  default     = "CodeDeployDefault.AllAtOnce"
}
