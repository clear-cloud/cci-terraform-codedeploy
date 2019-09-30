#
# CodeDeploy Deployment Group
#
resource "aws_codedeploy_deployment_group" "group" {
  app_name              = "${aws_codedeploy_app.app.name}"
  deployment_group_name = "${var.environment}-${aws_codedeploy_app.app.name}-deployment-group"
  service_role_arn      = "${aws_iam_role.role.arn}"
  autoscaling_groups    = ["${var.autoscaling_groups}"]

  deployment_style {
    deployment_option = "${var.deployment_option}"
    deployment_type   = "${var.deployment_type}"
  }

  blue_green_deployment_config {
    deployment_ready_option {
      action_on_timeout    = "${var.action_on_timeout}"
      wait_time_in_minutes = "${var.wait_time_in_minutes}"
    }
  

    green_fleet_provisioning_option {
      action = "${var.green_fleet_provisioning_option_action}"
    }

    terminate_blue_instances_on_deployment_success {
      action = "${var.terminate_blue_instances_on_deployment_success_action}"
    } 
  }
}
