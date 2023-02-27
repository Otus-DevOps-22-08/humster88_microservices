provider "yandex" {
  service_account_key_file = var.service_account_key_file
  cloud_id                 = var.cloud_id
  folder_id                = var.folder_id
  zone                     = var.zone
}
module "k8s_nodes" {
  source          = "./modules/k8s_nodes"
  public_key_path = var.public_key_path
  node_disk_image  = var.node_disk_image
  node_disk_size   = var.node_disk_size
  subnet_id       = var.subnet_id
  count_nodes       = var.count_nodes
}
