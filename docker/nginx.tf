resource "docker_image" "nginx_image" {
  name = data.docker_registry_image.nginx.name
}


resource "docker_container" "nginx_container" {
  name  = "nginx"
  image = docker_image.nginx_image.image_id

  ports {
    internal = 80
    external = 80
  }
}