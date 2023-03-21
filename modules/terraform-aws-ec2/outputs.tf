output "ec2_public_ip" {
  value = aws_instance.webserver.public_ip
}

output "webserver_url" {
  value = join("//", ["http:", aws_instance.webserver.public_ip])
}