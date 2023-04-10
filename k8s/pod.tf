resource "kubernetes_pod_v1" "webserver" {
  metadata {
    name      = "webserver"
    namespace = kubernetes_namespace_v1.web.id
  }

  spec {
    container {
      image = "nginx:latest"
      name  = "webserver"

      port {
        container_port = 80
      }
    }
  }
}