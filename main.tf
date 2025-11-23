
############################################################
# Local "cloud-init" placeholder
############################################################

# Render a cloud-init-style config from template
locals {
  cloud_init_config = templatefile("${path.module}/cloud-init/user-data.tpl", {
    hostname = var.hostname
  })
}

############################################################
# Docker resources
############################################################

resource "docker_image" "ubuntu" {
  name = var.image
}

resource "docker_container" "linux_vm" {
  name  = var.container_name
  image = docker_image.ubuntu.latest

  # Keep the container running
  tty        = true
  stdin_open = true
  command    = ["bash", "-c", "sleep infinity"]

  # Example: pass cloud-init config as an environment variable (placeholder)
  env = [
    "CLOUD_INIT_CONFIG_BASE64=${base64encode(local.cloud_init_config)}",
  ]

  # Optional: add labels for easier identification
  labels = [
    for k, v in var.vm_labels : {
      label = k
      value = v
    }
  ]
}
