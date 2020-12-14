variable "vsphere_user" {
    default = "administrator@vsphere.local"
}

variable "vsphere_unverified_ssl" {
    default = "true"
}

variable "vsphere_password" {
    default = "VMware1!"
}

variable "vsphere_server" {
    default = "vcsa.rpcb.local"
}

variable "Datacenter" {
  default = "Datacenter"
}

variable "Datastore" {
  default = "vsanDatastore"
}

variable "ClusterName" {
  default = "Cluster"
}

variable "vSphereHostIP" {
  default = "10.65.160.11"
}

variable "vSphereNetwork" {
  default = "Management Port Group"
}

variable "TemplateName" {
  default = "NICE-0911-TEST"
}

variable "HostName" {
  default = "Template-to-VM"
}

variable "IPAddress" {
  default = "10.65.160.200"
}

variable "IPV4_gateway" {
  default = "10.65.160.1"	
}
