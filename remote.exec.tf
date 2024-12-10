provider "aws" {
    region = "us-east-1"
  
}
resource "aws_security_group" "mysec" {
    name = "for_test"
    description = "for testing"
  
}

resource "aws_vpc_security_group_ingress_rule" "ingress_ssh" {
    security_group_id = aws_security_group.mysec.id
    cidr_ipv4 = "0.0.0.0/0"
    ip_protocol = "tcp"
    from_port = 22
    to_port = 22
  
}
resource "aws_vpc_security_group_ingress_rule" "ingress_http" {
    security_group_id = aws_security_group.mysec.id
    ip_protocol = "tcp"
    cidr_ipv4 = "0.0.0.0/0"
    from_port = 8080
    to_port = 8080
  
}
data "aws_ami" "newami" {
    most_recent = true
    owners = ["amazon"]

filter {
  name = "name"
  values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
} 
}


resource "aws_instance" "myec22" {
    ami = data.aws_ami.newami.image_id
    instance_type = "t2.micro"
    vpc_security_group_ids = [aws_security_group.mysec.id]
    key_name = "terraform"

connection {
    type = "ssh"
    user = "ubuntu"
    private_key = file("./terraform.pem")
    host = self.public_ip
  
}  
provisioner "remote-exec" {
    inline = [ 
        "sudo apt-get install nginx -y",
        "sudo systemctl start nginx",
     ]
  
}
  
}