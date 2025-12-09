variable "external_port" {
  default = 8085
}

resource "docker_container" "nginx_server" {
  image = docker_image.nginx.name
  name  = "nginx_server"

  ports {
    internal = 80
    external = var.external_port
  }
}
