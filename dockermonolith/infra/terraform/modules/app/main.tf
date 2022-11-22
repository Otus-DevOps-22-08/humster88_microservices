resource "yandex_compute_instance" "app" {
  name = "reddit-app${count.index+1}"
  count = var.instance_count
  labels = {
    tags = "reddit-app"
  }
  resources {
    cores  = 2
    memory = 2
    core_fraction = 20
  }

  boot_disk {
    initialize_params {
      image_id = var.app_disk_image
    }
  }

  network_interface {
    subnet_id = var.subnet_id
    nat = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file(var.public_key_path)}"
  }

  connection {
    type        = "ssh"
    host        = "${self.network_interface.0.nat_ip_address}"
    user        = "ubuntu"
    agent       = false
    private_key = file(var.private_key_path)
  }

  provisioner "remote-exec" {
    inline = ["sudo apt -y install python"]
  }

  provisioner "local-exec" {
    command = "ANSIBLE_CONFIG=/home/sa/humster88_microservices/dockermonolith/infra/ansible/ansible.cfg ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u ubuntu -i '${self.network_interface.0.nat_ip_address},' --private-key ${var.private_key_path} ../../ansible/playbooks/deploy.yml" 
  }

}

#resource "null_resource" "app-deploy" {
#  count = var.auto_deploy ? 1 : 0

#  triggers = {
#    app_id = yandex_compute_instance.app.id
#  }

#  connection {
#    type  = "ssh"
##    host = "${self.network_interface.0.nat_ip_address}"
#    host  = yandex_compute_instance.app.network_interface.0.nat_ip_address
#    user  = "ubuntu"
#    agent = false
    # путь до приватного ключа
#    private_key = file(var.private_key_path)
#  }

#  provisioner "file" {
#    content     = templatefile("${path.module}/puma.service.tftpl", { db_ip = var.db_ip })
#    destination = "/tmp/puma.service"
#  }

#  provisioner "remote-exec" {
#    script = "${path.module}/deploy.sh"
#  }
#}
