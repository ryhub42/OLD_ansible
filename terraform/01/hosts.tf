resource "local_file" "foo" {
  content     = "${aws_instance.web[0]}\n${aws_instance.web[1]}\n"
  filename = "/home/centos/ansible/hosts"
}