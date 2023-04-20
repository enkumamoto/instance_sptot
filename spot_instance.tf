resource "aws_iam_instance_profile" "instance_profile_spot" {
  name = "example-instance-profile-spot"
  role = aws_iam_role.instance_role_spot.name
}
