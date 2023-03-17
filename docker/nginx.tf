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
  volumes {
    host_path      = "/Users/malik/course/devops-terraform/docker/html"
    container_path = "/usr/share/nginx/html"
  }
}