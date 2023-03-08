data "digitalocean_image" "centos" {
  slug = var.image_slug
}