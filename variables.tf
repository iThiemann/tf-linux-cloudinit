
variable "container_name" {
  description = "Name of the Linux 'VM' container"
  type        = string
  default     = "linux-vm"
}

variable "image" {
  description = "Base image to use for the container"
  type        = string
  default     = "ubuntu:22.04"
}

variable "hostname" {
  description = "Hostname to inject into cloud-init config"
  type        = string
  default     = "local-linux-vm"
}

variable "vm_labels" {
  description = "Optional labels to add to the container"
  type        = map(string)
  default     = {
    environment = "dev"
    project     = "local-linux-vm"
  }
}
