resource "aws_ebs_volume" "ebs_volume" {
  count             = length(var.ebs_volumes)
  availability_zone = aws_instance.webserver.availability_zone
  size              = var.ebs_volumes[count.index].volume_size
  type              = var.ebs_volumes[count.index].type
  iops              = var.ebs_volumes[count.index].iops
  throughput        = var.ebs_volumes[count.index].throughput

  tags = {
    Name = "${var.ec2_name}-${var.ebs_volumes[count.index].volume_name}"
  }
}

resource "aws_volume_attachment" "ebs_attachment" {
    count        = length(var.ebs_volumes)
    instance_id  = aws_instance.webserver.id
    volume_id    = aws_ebs_volume.ebs_volume[count.index].id
    device_name  = var.ebs_volumes[count.index].device_name
    skip_destroy = false
}