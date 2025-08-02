resource "aws_instance" "kdemo_app" {
  ami           = "ami-0175d4f2509d1d9e8"
  instance_type = "t2.micro"
  key_name      = "skotts-key"
  security_groups = [aws_security_group.kdemo_app_sg.name]


  tags = {
    Name = "kdemo-app"
  }
user_data = file("${path.module}/userdata.sh")
iam_instance_profile = aws_iam_instance_profile.kdemo_app_instance_profile.id
}