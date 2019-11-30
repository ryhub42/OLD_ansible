resource "local_file" "foo" {
  content     = "a\nb"
  filename = "/home/centos/ansible/hosts"
}