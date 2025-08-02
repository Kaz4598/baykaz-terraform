resource "aws_security_group" "kdemo_app_sg" {
    name = "kdemo-app"
    description = "security group for kdemo application"
    vpc_id = "vpc-08dfb3b1ef2abb0d6"
    tags = {
      Name = "kdemo-app-sg "
    }
  
}

#inbound rule
resource "aws_security_group_rule" "ingress_ssh" {
    type = "ingress"
    description = "ssh access"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    security_group_id = aws_security_group.kdemo_app_sg.id
  
}
resource "aws_security_group_rule" "ingress_http" {
    type = "ingress"
    description = "http access"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    security_group_id = aws_security_group.kdemo_app_sg.id
  
}
resource "aws_security_group_rule" "ingress_https" {
    type = "ingress"
    description = "https access"
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    security_group_id = aws_security_group.kdemo_app_sg.id
  
}
#outbound rule
resource "aws_security_group_rule" "egress_access" {
    type = "egress"
    description = "outbound access from ec2"
    from_port = 0
    to_port = 0
    protocol = -1
    cidr_blocks = ["0.0.0.0/0"]
    security_group_id = aws_security_group.kdemo_app_sg.id
  
}