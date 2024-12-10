/*resource "aws_security_group" "newsec" {
    name = "nessec"
    description = "for security purpose"

dynamic "ingress" {
    for_each = var.test
    content {
      from_port = ingress.value
      to_port = ingress.value
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
}
tags = {
  "Name" = "sec"
}

}
resource "aws_iam_user" "test" {
  name = "tony"
  
}

*/
