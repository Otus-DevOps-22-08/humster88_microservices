resource "yandex_compute_instance" "node" {

  name  = "node${count.index + 1}"
  count = var.count_nodes

  resources {
    cores  = 4
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id = var.node_disk_image
      size = var.node_disk_size
    }
  }

  network_interface {
    subnet_id = var.subnet_id
    nat       = true
  }

  metadata = {
    ssh-keys           = "ubuntu:${file(var.public_key_path)}"
    serial-port-enable = 1
  }
}
