resource "aws_instance" "webserver" {
  ami                         = data.aws_ami.latest_ami.id
  instance_type               = var.instance_type
  associate_public_ip_address = var.public_ip
  vpc_security_group_ids      = var.sg_ids
  subnet_id                   = data.aws_subnet.public_subnet_1a.id
  key_name                    = var.key_name

  tags = {
    "Name" = "${var.prefix}-${var.ec2_name}"
  }
}

resource "null_resource" "trigger_on_instance_id" {
  triggers = {
    id     = aws_instance.webserver.id
  }
  provisioner "local-exec" {
    command    = "echo ${var.ec2_name}:${aws_instance.webserver.private_ip} >> ec2s.txt"
    on_failure = continue
  }

  provisioner "file" {
    source      = "httpd.sh"
    destination = "/tmp/httpd.sh"
    on_failure  = continue
  }
  connection {
    type        = "ssh"
    host        = aws_instance.webserver.public_ip
    user        = "ec2-user"
    private_key = file("~/.ssh/aws-golden-key")
    timeout     = "5m"
  }

  provisioner "remote-exec" {
    inline     = ["chmod u+x /tmp/httpd.sh", "/tmp/httpd.sh"]
    on_failure = continue
  }

  provisioner "remote-exec" {
    inline     = ["sudo hostnamectl set-hostname ${var.ec2_name}"]
    on_failure = continue
  }
}

resource "null_resource" "free_fly" {
  
  provisioner "local-exec" {
    command    = "I am flying free"
    on_failure = continue
  }
}
