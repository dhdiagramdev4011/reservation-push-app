provider "aws" {
    region = "ap-northeast-2" 
}

module "module-test" {
    server_port = "${var.server_port}"
    source = "/Users/dohyoungkim/Downloads/rockplaceCloudBiz-Terraform/vmware/terraform-vmware/RUNNING/prod"
    module-test = 5
}



