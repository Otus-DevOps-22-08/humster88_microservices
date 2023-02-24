variable cloud_id {
  type        = string
  description = "Cloud"
}

variable folder_id {
  type        = string
  description = "Folder"
}

variable zone {
  type        = string
  description = "Zone"
  default     = "ru-central1-a"
}

variable public_key_path {
  type        = string
  description = "Path to the public key used for ssh access"
}

variable subnet_id {
  type        = string
  description = "Subnet"
}

variable service_account_key_file {
  type        = string
  description = "key.json"
}

variable count_nodes {
  type        = number
  description = "count VMs"
  default     = 2
}

variable node_disk_image {
  type        = string
  description = "Disk image for k8s node"
  default     = "fd8snjpoq85qqv0mk9gi"
}

variable node_disk_size {
  type        = number
  description = "Disk size for k8s node"
  default     = 40
}
