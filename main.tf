resource "aws_instance" "ec2-linux" {
    ami = "ami-0453ec754f44f9a4a"
    instance_type = "t2.micro"
  
}