terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.2"
    }
  }
}

provider "docker" {}

# Pulls the latest NGINX image
resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = true
}

# Creates and runs the NGINX container
resource "docker_container" "nginx" {
  image = docker_image.nginx.image_id
  name  = "nginx-container"

  ports {
    internal = 80
    external = 8081
  }
}
