resource "digitalocean_droplet" "dbserver" {
  count     = length(var.db_hosts)
  image     = data.digitalocean_image.centos.slug
  name      = var.db_hosts[count.index]
  region    = digitalocean_vpc.do_vpc.region 
  vpc_uuid  = digitalocean_vpc.do_vpc.id
  size      = var.droplet_size
  ssh_keys  = [digitalocean_ssh_key.do-ssh_key.id]
  user_data = "${file("db.sh")}"

  depends_on = [
    digitalocean_vpc.do_vpc,
    digitalocean_ssh_key.do-ssh_key,
    digitalocean_project.devops
  ]

}

resource "digitalocean_project_resources" "droplet_project" {
    count    = length(var.db_hosts)
    project = digitalocean_project.devops.id
    resources = [digitalocean_droplet.dbserver[count.index].urn]
}