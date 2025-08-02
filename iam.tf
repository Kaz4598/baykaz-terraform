resource "aws_iam_role" "kdemo_app_role" {
    assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "Service": "ec2.amazonaws.com"
            },
            "Action": "sts:AssumeRole"
        }
    ]
}
  EOF
}

resource "aws_iam_role_policy" "kdemo_app_role_s3_policy" {
    name = "kdemo-app-role-s3-policy"
    role = aws_iam_role.kdemo_app_role.id
    policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "s3:*",
                "s3-object-lambda:*"
            ],
            "Resource": "*"
        }
    ]
}
  EOF
}

resource "aws_iam_instance_profile" "kdemo_app_instance_profile" {
  
  name = "kdemo-app-ainstance-profile"
  role = aws_iam_role.kdemo_app_role.id
}