resource "docker_image" "mysql_image" {
  name = data.docker_registry_image.mysql.name
}

resource "docker_volume" "mysql_volume" {
    name = "mysql_home"
    lifecycle {
     prevent_destroy = false
  }
}

resource "random_password" "mysql_root_password" {
    length = 8
    special = false
}

resource "docker_container" "mysql_container" {
  name           = "mysql"
  image          = docker_image.mysql_image.image_id
  restart        = "on-failure"

  env = ["MYSQL_ROOT_PASSWORD=${random_password.mysql_root_password.result}"]

  ports {
    internal = 3306
    external = 3306
  }

  volumes {
    container_path = "/var/lib/mysql" 
    volume_name    = docker_volume.mysql_volume.name
  }

  depends_on = [ docker_volume.mysql_volume]
}