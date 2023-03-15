terraform {
  required_providers {
    yandex = {
      source = "registry.tfpla.net/yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

provider "yandex" {
  service_account_key_file = var.service_account_key_file
  cloud_id                 = var.cloud_id
  folder_id                = var.folder_id
  zone                     = var.zone
}
module "ya_k8s" {
  source                  = "../modules/ya_k8s"
  public_key_path         = var.public_key_path
  service_account_id      = var.service_account_id
  count_node              = var.count_node
}
