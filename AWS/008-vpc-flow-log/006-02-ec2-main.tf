/*** AMI ***/
data "aws_ami" "rhel" {
  most_recent = true

  filter {
    name   = "name"
    values = ["RHEL-8.*x86_64-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["309956199498"]
}

/*** EC2 Instance ***/
resource "aws_instance" "vpc_01_web_server" {
  ami                         = data.aws_ami.rhel.id
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.vpc_01_public_subnets["public-subnet-01"].id
  associate_public_ip_address = true
  security_groups             = [aws_security_group.vpc_01_sg_01.id, aws_security_group.vpc_01_sg_02.id]
  key_name                    = aws_key_pair.generated.key_name
  connection {
    user        = "ec2-user"
    host        = self.public_ip
    private_key = tls_private_key.generated.private_key_pem
  }

  provisioner "local-exec" {
    command = "chmod 600 ${local_file.private_key_pem.filename}"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum install -y httpd",
      "echo '<html>Hello</html>' | sudo tee /var/www/html/index.html",
      "sudo chown -R apache:apache /var/www/html/",
      "sudo chmod -R 755 /var/www/html/",
      "sudo restorecon -Rv /var/www/html",
      "sudo systemctl enable --now httpd",
    ]
  }

  lifecycle {
    ignore_changes = [security_groups]
  }

  tags = {
    Name      = "${local.prefix}-${var.vpc_01_name}-web-server"
    Tier      = "web"
    OS        = "RHEL"
    Terraform = "true"
  }
}

/*** Private Key ***/
resource "tls_private_key" "generated" {
  algorithm = "RSA"
}

resource "local_file" "private_key_pem" {
  content  = tls_private_key.generated.private_key_pem
  filename = "keys/aws-key-01.pem"
}

/*** Public Key ***/
resource "aws_key_pair" "generated" {
  key_name   = "aws-key-01"
  public_key = tls_private_key.generated.public_key_openssh
}
