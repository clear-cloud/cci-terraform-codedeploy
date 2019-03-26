#
# CodeDeploy Deployment Group
#
resource "aws_codedeploy_deployment_group" "example" {
  app_name              = "${aws_codedeploy_app.app.name}"
  deployment_group_name = "${var.environment}-${aws_codedeploy_app.app.name}-deployment-group"
  service_role_arn      = "${aws_iam_role.role.arn}"
  autoscaling_groups    = ["${var.autoscaling_groups}"]



}
