resource "aws_instance" "web" {
  count                    = 2
  ami                      = "ami-02383135f96b2293e"
  instance_type            = "t2.micro"
  key_name                 = "devops"
  vpc_security_group_ids   = ["sg-08bed8525f85d783e","sg-0f8ef2eb8f766f7d1"]

  tags = {
    Name = "Ansible-Node-${count.index+1}"
  }
}