variable "rg_name" {}
variable "location" {}
variable "vm_public_ip" {}
variable "linux-nic-id" {
  type = list(string)
}

variable "nb_count" {}
variable "subnet_id" {}
variable "tags" {
  type    = map(string)
}
variable "linux_vm_name" {}