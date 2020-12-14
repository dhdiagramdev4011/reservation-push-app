variable "vsphere_user" {
    default = "administrator@vsphere.local"
}

variable "vsphere_password" {
    default = "VMware1!"
}

variable "vsphere_server" {
    default = "VCSA.rpcb.local"
}

variable "vm-count" {
    type = string
    default = 1
}

variable "vm_ip" {
    type = string
    default = "10.65.160.206"
}

variable "vm_netmask" {
    type = string
    default = 24
}

variable "vm_gateway" {
    type = string
    default = "10.65.160.1"
}

variable "vm_dns_servers" {
    type = string
    default = "8.8.8.8"
}

variable "vm_domain" {
    default = "rpcb.local"
}

variable "vm_user" {
    default = "root"
}

variable "password" {
    default = "rplinux"
}

variable "servername" {
    default = "app-test"
}

variable "rpm" {
    default = "aaa.sh"
}