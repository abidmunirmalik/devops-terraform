output "keypair_name" {
  value = aws_key_pair.keypair.id
}

output "vpc_cidr" {
  value = data.aws_vpc.vpc.cidr_block
}

output "sg_name" {
  value = aws_security_group.sg.name
}

output "ec2_public_ip" {
  value = aws_instance.webserver.public_ip
}

output "webserver_url" {
  value = join("//", ["http:", aws_instance.webserver.public_ip])
}