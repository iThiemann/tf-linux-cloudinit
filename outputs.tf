
output "container_id" {
  description = "ID of the local Linux VM container"
  value       = docker_container.linux_vm.id
}

output "cloud_init_config" {
  description = "Rendered cloud-init placeholder configuration"
  value       = local.cloud_init_config
}
