#
# CodeDeploy Deployment Group
#
resource "aws_codedeploy_deployment_group" "example" {
  app_name               = "${aws_codedeploy_app.app.name}"
  deployment_group_name  = "${var.environment}-${aws_codedeploy_app.app.name}-deployment-group"
  deployment_config_name = "${var.deployment_config_name}"
  service_role_arn       = "${aws_iam_role.role.arn}"
  autoscaling_groups     = ["${var.autoscaling_groups}"]

  deployment_style {
    deployment_option = "${var.deployment_option}"
    deployment_type   = "${var.deployment_type}"
  }

  blue_green_deployment_config {
    deployment_ready_option {
      action_on_timeout = "${var.action_on_timeout}"
    }

    green_fleet_provisioning_option {
      action = "${var.green_fleet_provisioning_option_action}"
    }

    terminate_blue_instances_on_deployment_success {
      action = "${var.terminate_blue_instances_on_deployment_success_action}"
    }
  }

  load_balancer_info {
    target_group_info {
      name = "${var.listener_name}"
    }
  }

  auto_rollback_configuration {
    enabled = true
    events  = ["DEPLOYMENT_FAILURE"]
  }

  lifecycle {
    # Ignore changes to autoscaling_groups as these will change
    # due to Blue-Green deployment
    ignore_changes = ["autoscaling_groups"]
  }
}
