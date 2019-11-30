resource "local_file" "foo" {
  content     = "${aws_instance.web.public_ip[0]}\n${aws_instance.web.public_ip[1]}\n"
  filename = "/home/centos/ansible/hosts"
}