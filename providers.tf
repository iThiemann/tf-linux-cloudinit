
terraform {
  required_version = ">= 1.14.0"

  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.6.2"
    }
  }
}

provider "docker" {
  # Uses local Docker daemon (e.g. Docker Desktop, Colima, etc.)
}
