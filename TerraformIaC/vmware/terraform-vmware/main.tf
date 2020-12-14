// comment
# comment
/*
comment
*/

provider "vsphere" {
  user           = "${var.vsphere_user}"
  password       = "${var.vsphere_password}"
  vsphere_server = "${var.vsphere_server}"

  allow_unverified_ssl = true
}

data "vsphere_datacenter" "dc" {
  name = "Datacenter"
}

data "vsphere_virtual_machine" "template" {
    name = "dhkim-template-test"
    datacenter_id = "${data.vsphere_datacenter.dc.id}"
}


data "vsphere_datastore" "datastore" {
  name          = "vsanDatastore"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_compute_cluster" "cluster" {
  name          = "Cluster"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_network" "network" {
  name          = "DPortGroup"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}


resource "vsphere_virtual_machine" "vm" {
    name = "dhkim-template-app-deploy-0001"
    resource_pool_id = "${data.vsphere_compute_cluster.cluster.resource_pool_id}"
    datastore_id = "${data.vsphere_datastore.datastore.id}"

    num_cpus = 1
    memory = 4096
    guest_id = "centos7_64Guest"

    network_interface {
      network_id   = "${data.vsphere_network.network.id}"
      adapter_type = "${data.vsphere_virtual_machine.template.network_interface_types[0]}"
    }

  disk {
     label = "disk0"
     size  = "20"
  }

  clone {
    template_uuid = "${data.vsphere_virtual_machine.template.id}"

    customize {
      timeout = 0

      linux_options {
        host_name = "dhkim-template-app-deploy-1000"
        domain    = "rpcb.local"
      }
      network_interface {
        ipv4_address = "10.65.160.210"
        ipv4_netmask = 16
        dns_server_list = ["8.8.8.8"]
      }
      ipv4_gateway = "10.65.160.1"
    }
  }
}


resource "null_resource" "vm" {
  
  connection {
    type = "ssh"
    host = "${vsphere_virtual_machine.vm.default_ip_address}"
    user = "root"
    password = "${var.password}"
    port = "22"
    agent = false
  }

  provisioner "file" {
      source      = "./${var.rpm}"
      destination = "./${var.rpm}"
    }
 provisioner "remote-exec" {
    inline = [
      "chmod +x ./${var.rpm}",
      "yum update -y",
      "yum install python3* -y",
      "yum install python3-pip",
      "yum install -y wget",
      "yum install -y git",
      "pip3 install Django==2.1.5",
      "pip3 install pylint",
      "pip3 install autopep8",
      "mkdir /app",
      "cd /app ; git clone -b develop https://github.com/dhdiagram4011/reservation-app-project.git",
      "python3 /app/manage.py makemigrations",
      "python3 /app/manage.py migrate"
    ]
  }
}

output "my_ip_address" {
 value = "${vsphere_virtual_machine.vm.default_ip_address}"
}