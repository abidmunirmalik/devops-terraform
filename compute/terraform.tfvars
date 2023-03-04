profile    = "devops"
region     = "us-east-1"
key_name   = "aws-golden-key"
public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHRkb4F2zH9gyXHzItguVMpVqZc/Sjj4dZM1ahGSIVV7 AWS-Golden-Key"
prefix     = "lab"
sg_name    = "ec2-sg"

ingress_rules = [
  {
    "description" = "SSH from internet"
    "from_port"   = "22"
    "to_port"     = "22"
    "protocol"    = "tcp"
    "cidr_blocks" = "0.0.0.0/0"
  },
  {
    "description" = "HTTP from internet"
    "from_port"   = "80"
    "to_port"     = "80"
    "protocol"    = "tcp"
    "cidr_blocks" = "0.0.0.0/0"
  },
  {
    "description" = "Ping from internet"
    "from_port"   = 0
    "to_port"     = 0
    "protocol"    = "icmp"
    "cidr_blocks" = "0.0.0.0/0"
  }
]

# EC2 Variables
instance_type = "t2.micro"
ec2_name      = "webserver"

# EBS Volumes
ebs_volumes = [
    {
      volume_size = "1"
      volume_name = "web"
      device_name = "/dev/sdb"
      type        = "gp3"
      iops        = 3000
      throughput  = 125
    },
    {
      volume_size = "1"
      volume_name = "data"
      device_name = "/dev/sdc"
      type        = "gp3"
      iops        = 3000
      throughput  = 125
    }
]