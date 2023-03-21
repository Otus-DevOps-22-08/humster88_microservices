output "cluster_external_v4_endpoint" {
  value = yandex_vpc_address.address.external_ipv4_address[0].address
}
