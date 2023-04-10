resource "kubernetes_namespace_v1" "web" {
  metadata {
    name = "web"
  }
}