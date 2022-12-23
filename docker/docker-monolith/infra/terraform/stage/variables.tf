variable cloud_id {
  description = "Cloud"
}
variable folder_id {
  description = "Folder"
}
variable zone {
  description = "Zone"
  # Значение по умолчанию
  default = "ru-central1-a"
}
variable instance_count {
  type        = number
  description = "Count of instances"
  # Значение по умолчанию
  default = 1
}
variable public_key_path {
  # Описание переменной
  description = "Path to the public key used for ssh access"
}
variable private_key_path {
  # Описание переменной
  description = "Path to the public key used for ssh access"
}
variable app_image_id {
  description = "Disk image"
}
variable subnet_id {
  description = "Subnet"
}
variable service_account_key_file {
  description = "key .json"
}
variable app_disk_image {
  description = "Disk image for reddit app"
  default     = "reddit-app-base"
}
variable "bucket_access_key" {
  description = "bucket_access_key"
}
variable "bucket_secret_key" {
  description = "bucket_secret_key"
}
