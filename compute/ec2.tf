resource "aws_instance" "webserver" {
  ami                         = data.aws_ami.latest_ami.id
  instance_type               = var.instance_type
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.sg.id]
  subnet_id                   = data.aws_subnet.public_subnet_1a.id
  key_name                    = aws_key_pair.keypair.id

  provisioner "local-exec" {
    command    = "echo ${self.private_ip} >> ec2s.txt"
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
    private_key = file("/Users/malik/.ssh/aws-golden-key")
    timeout     = "5m"
  }

  provisioner "remote-exec" {
    inline     = ["chmod u+x /tmp/httpd.sh", "/tmp/httpd.sh"]
    on_failure = continue
  }

  tags = {
    "Name" = "${var.prefix}-${var.ec2_name}"
  }
}


# null_resource Resource
  resource "null_resource" "on_ec2_id_change" {
  triggers = {
    id = aws_instance.webserver.id
  }
