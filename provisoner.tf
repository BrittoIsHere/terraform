/*resource "aws_instance" "myec2" {
    ami = "ami-0453ec754f44f9a4a"
    instance_type = "t2.micro"
    
    provisioner "remote-exec" {
        "sudo install apache2 -y"
      
    }
    provisioner "local-exec" {
        command = "echo ${self.public_ip} >> test.txt"
      
    }
  
}*/