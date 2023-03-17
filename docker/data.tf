data "docker_registry_image" "nginx" {
  name = "nginx"
}

data "docker_registry_image" "jenkins" {
  name = "jenkins/jenkins"
}

data "docker_registry_image" "mysql" {
  name = "mysql"
}