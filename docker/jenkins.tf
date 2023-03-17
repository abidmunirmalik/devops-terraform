resource "docker_image" "jenkins_image" {
  name = data.docker_registry_image.jenkins.name
}

resource "docker_volume" "jenkins_volume" {
    name = "jenkins_home"

    lifecycle {
     prevent_destroy = false
  }
}

resource "docker_container" "jenkins_container" {
  name           = "jenkins"
  image          = docker_image.jenkins_image.image_id
  restart        = "on-failure"

  ports {
    internal = 8080
    external = 8080
  }

  ports {
    internal = 50000
    external = 50000
  }

  volumes {
    container_path = "/var/jenkins_home" 
    volume_name    = docker_volume.jenkins_volume.name
  }
  depends_on = [ docker_volume.jenkins_volume]
}