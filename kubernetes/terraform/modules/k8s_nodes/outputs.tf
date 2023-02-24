output "external_ip_address_k8s_node" {
  value = yandex_compute_instance.node.*.network_interface.0.nat_ip_address
}
