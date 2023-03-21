terraform {
  required_providers {
    yandex = {
      source = "registry.tfpla.net/yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

resource "yandex_kubernetes_cluster" "cluster" {
  name        = "cluster"
  network_id  = yandex_vpc_network.network.id

  master {
    version = "1.23"
    zonal {
      zone      = yandex_vpc_subnet.subnet.zone
      subnet_id = yandex_vpc_subnet.subnet.id
    }
    public_ip = true
  }

  service_account_id      = var.service_account_id
  node_service_account_id = var.service_account_id

  release_channel = "RAPID"
  network_policy_provider = "CALICO"
}

resource "yandex_kubernetes_node_group" "group" {
  cluster_id = yandex_kubernetes_cluster.cluster.id
  name       = "group"
  version    = "1.23"

  instance_template {
    platform_id = "standard-v2"

    network_interface {
      nat        = true
      subnet_ids = [yandex_vpc_subnet.subnet.id]
    }

    resources {
      cores         = 4
      memory        = 8
      core_fraction = 50
    }
    metadata = {
      ssh-keys = "ubuntu:${file(var.public_key_path)}"
    }
  }
  scale_policy {
    fixed_scale {
      size = var.count_node
    }
  }
}

resource "yandex_vpc_network" "network" {
  name = "network"
}

resource "yandex_vpc_subnet" "subnet" {
  zone           = var.zone
  network_id     = yandex_vpc_network.network.id
  v4_cidr_blocks = ["192.168.10.0/24"]
  depends_on = [
    yandex_vpc_network.network,
  ]
}

resource "yandex_vpc_address" "address" {
  name = "static-ip"
  external_ipv4_address {
    zone_id = var.zone
  }
}
