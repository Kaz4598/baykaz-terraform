resource "aws_instance" "kdemo_app" {
  ami           = "ami-0175d4f2509d1d9e8"
  instance_type = "t2.micro"
  key_name      = "skotts-key"


  tags = {
    Name = "kdemo-app"
  }

}