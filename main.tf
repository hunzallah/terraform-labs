terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.25.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "nginx" {
  name = "nginx:latest"
}

resource "docker_container" "nginx_server" {
  image = docker_image.nginx.name
  name  = "nginx_server"

  ports {
    internal = 80
    external = 8085
  }
}
