profile        = "devops"
region         = "us-east-1"
vpc_cidr_block = "192.168.0.0/16"
vpc_name       = "main-vpc"
igw_name       = "main-igw"
prefix         = "lab"


azs          = ["us-east-1a", "us-east-1b", "us-east-1c", "us-east-1d"]
cidr_blocks  = ["192.168.1.0/24", "192.168.2.0/24", "192.168.3.0/24", "192.168.4.0/24"]
public_ips   = [true, false, true, false]
subnet_names = ["public-subnet-1a", "private-subnet-1b", "public-subnet-1c", "private-subnet-1d"]

rt_name = "internet-route"