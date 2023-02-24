variable public_key_path {
  description = "Path to the public key used for ssh access"
  type        = string
  default     = "~/.ssh/id_rsa.pub"
}

variable node_disk_image {
  description = "Disk image for k8s node"
  type        = string
  default     = "fd8snjpoq85qqv0mk9gi"
}

variable subnet_id {
  description = "Subnets for modules"
  type        = string
}

variable count_nodes {
  type        = number
  description = "count VMs"
  default     = 2
}

variable node_disk_size {
  type        = number
  description = "Disk size for app"
  default     = 40
}
