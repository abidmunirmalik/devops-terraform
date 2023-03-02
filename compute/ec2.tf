resource "aws_instance" "webserver" {
  ami                         = data.aws_ami.latest_ami.id
  instance_type               = var.instance_type
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.sg.id]
  subnet_id                   = data.aws_subnet.public_subnet_1a.id
  key_name                    = aws_key_pair.keypair.id
  
  tags = {
    "Name" = "${var.prefix}-${var.ec2_name}"
  }
}
