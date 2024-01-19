data "aws_ami" "my_ami" {
  most_recent = true
  name_regex  = "^ansible-controller.*"
  owners      = ["816827255260"]

}

resource "aws_instance" "web-1" {

  ami                         = data.aws_ami.my_ami.id
  availability_zone           = "ap-south-2a"
  instance_type               = var.instance_type
  key_name                    = var.key_name
  subnet_id                   = aws_subnet.subnet1-public.id
  vpc_security_group_ids      = [aws_security_group.allow-all.id]
  associate_public_ip_address = true

  tags = {
    Name       = "Server-1"
    Env        = "Prod"
    Owner      = "naresh"
    CostCenter = "ABCD"
  }
  user_data = <<-EOF
              #!/bin/bash
              sudo useradd -m ansibleadmin --shell /bin/bash
              sudo mkdir -p /home/ansibleadmin/.ssh
              sudo chown -R ansibleadmin /home/ansibleadmin/
              sudo touch /home/ansibleadmin/.ssh/authorized_keys
              sudo usermod -aG sudo ansibleadmin
              echo 'ansibleadmin ALL=(ALL) NOPASSWD: ALL' | sudo tee -a /etc/sudoers
              echo 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCKZB5OrL0QusnAOZN4dW8TMd0j64rwiUfWc+nRoPNziwmNxFa/ljwNczVvB7hdUPG2NAgc/0CrRhVHvl9DLQn7wZTd0RvO/XUUlsNsLWRn0RMG/RgpTtsTVCjPAF5kiuR+bMq4XidOh3M8c4T5WjOg1P7x8VXEVKKxESvxzsAQFQGDdP9fYtvoF9gcCLCrlKx1+0/iCoBKH+6NuT5s6gXkJ7b6EytNfv2UKmftvZV1pst+4AvKvSceL1NBepyeitctl3liPUTeXzVFNZq7MPTAg2mzEjKask2vVWPNjZ5c9yD97WtZOFt8cC9oU2M+9TT8aN85V/W8vQ+ZKr0Wcn4b root@ip-10-0-0-22' | sudo tee -a /home/ansibleadmin/.ssh/authorized_keys
              EOF
}

resource "aws_instance" "web-2" {

  ami                         = data.aws_ami.my_ami.id
  availability_zone           = "ap-south-2b"
  instance_type               = var.instance_type
  key_name                    = var.key_name
  subnet_id                   = aws_subnet.subnet2-public.id
  vpc_security_group_ids      = [aws_security_group.allow-all.id]
  associate_public_ip_address = true
  tags = {
    Name       = "Server-2"
    Env        = "Prod"
    Owner      = "naresh"
    CostCenter = "ABCD"
  }
  user_data = <<-EOF
              #!/bin/bash
              sudo useradd -m ansibleadmin --shell /bin/bash
              sudo mkdir -p /home/ansibleadmin/.ssh
              sudo chown -R ansibleadmin /home/ansibleadmin/
              sudo touch /home/ansibleadmin/.ssh/authorized_keys
              sudo usermod -aG sudo ansibleadmin
              echo 'ansibleadmin ALL=(ALL) NOPASSWD: ALL' | sudo tee -a /etc/sudoers
              echo 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCKZB5OrL0QusnAOZN4dW8TMd0j64rwiUfWc+nRoPNziwmNxFa/ljwNczVvB7hdUPG2NAgc/0CrRhVHvl9DLQn7wZTd0RvO/XUUlsNsLWRn0RMG/RgpTtsTVCjPAF5kiuR+bMq4XidOh3M8c4T5WjOg1P7x8VXEVKKxESvxzsAQFQGDdP9fYtvoF9gcCLCrlKx1+0/iCoBKH+6NuT5s6gXkJ7b6EytNfv2UKmftvZV1pst+4AvKvSceL1NBepyeitctl3liPUTeXzVFNZq7MPTAg2mzEjKask2vVWPNjZ5c9yD97WtZOFt8cC9oU2M+9TT8aN85V/W8vQ+ZKr0Wcn4b root@ip-10-0-0-22' | sudo tee -a /home/ansibleadmin/.ssh/authorized_keys
              EOF
}

resource "aws_instance" "web-3" {

  ami                         = data.aws_ami.my_ami.id
  availability_zone           = "ap-south-2c"
  instance_type               = var.instance_type
  key_name                    = var.key_name
  subnet_id                   = aws_subnet.subnet3-public.id
  vpc_security_group_ids      = [aws_security_group.allow-all.id]
  associate_public_ip_address = true
  tags = {
    Name       = "Server-3"
    Env        = "Prod"
    Owner      = "naresh"
    CostCenter = "ABCD"
  }
  user_data = <<-EOF
              #!/bin/bash
              sudo useradd -m ansibleadmin --shell /bin/bash
              sudo mkdir -p /home/ansibleadmin/.ssh
              sudo chown -R ansibleadmin /home/ansibleadmin/
              sudo touch /home/ansibleadmin/.ssh/authorized_keys
              sudo usermod -aG sudo ansibleadmin
              echo 'ansibleadmin ALL=(ALL) NOPASSWD: ALL' | sudo tee -a /etc/sudoers
              echo 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCKZB5OrL0QusnAOZN4dW8TMd0j64rwiUfWc+nRoPNziwmNxFa/ljwNczVvB7hdUPG2NAgc/0CrRhVHvl9DLQn7wZTd0RvO/XUUlsNsLWRn0RMG/RgpTtsTVCjPAF5kiuR+bMq4XidOh3M8c4T5WjOg1P7x8VXEVKKxESvxzsAQFQGDdP9fYtvoF9gcCLCrlKx1+0/iCoBKH+6NuT5s6gXkJ7b6EytNfv2UKmftvZV1pst+4AvKvSceL1NBepyeitctl3liPUTeXzVFNZq7MPTAg2mzEjKask2vVWPNjZ5c9yD97WtZOFt8cC9oU2M+9TT8aN85V/W8vQ+ZKr0Wcn4b root@ip-10-0-0-22' | sudo tee -a /home/ansibleadmin/.ssh/authorized_keys
              EOF
}

