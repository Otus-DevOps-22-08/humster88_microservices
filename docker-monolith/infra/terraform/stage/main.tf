provider "yandex" {
  service_account_key_file = var.service_account_key_file
  cloud_id                 = var.cloud_id
  folder_id                = var.folder_id
  zone                     = var.zone
}
module "app" {
  source           = "../modules/app"
  public_key_path  = var.public_key_path
  app_disk_image   = var.app_disk_image
  subnet_id        = var.subnet_id
  private_key_path = var.private_key_path
  db_ip            = "127.0.0.1"
#  auto_deploy      = var.auto_deploy
  instance_count   = var.instance_count
}

#resource "yandex_compute_instance" "app" {
#  name = "reddit-app${count.index+1}"
##  name = "reddit-app"
#  count = var.cnt
#  zone = var.zone
#  resources {
#    cores         = 2
#    memory        = 2
#    core_fraction = 20
#  }

#  boot_disk {
#    initialize_params {
# Указать id образа созданного в предыдущем домашем задании
#      image_id = var.image_id
#    }
#  }

#  network_interface {
# Указан id подсети default-ru-central1-a
#    subnet_id = "${yandex_vpc_subnet.app-subnet.id}"
#    nat       = true
#  }

#  metadata = {
#    ssh-keys = "ubuntu:${file(var.public_key_path)}"
#  }

#  connection {
#    type  = "ssh"
#    host = "${self.network_interface.0.nat_ip_address}"
##    host  = yandex_compute_instance.app.network_interface.0.nat_ip_address
#    user  = "ubuntu"
#    agent = false
# путь до приватного ключа
#    private_key = file(var.private_key_path)
#  }

#  provisioner "file" {
#    source      = "files/puma.service"
#    destination = "/tmp/puma.service"
#  }

#  provisioner "remote-exec" {
#    script = "files/deploy.sh"
#  }
#}
