resource "aws_instance" "web" {
  count         = 2
  ami           = "ami-02383135f96b2293e"
  instance_type = "t2.micro"
  key_name      = "devops"

  tags = {
    Name = "Ansible-Node-${count.index+1}"
  }
}