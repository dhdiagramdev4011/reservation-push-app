source "amazon-ebs" "app-deploy-example" {
    ami_name = "api-app-deploy"
    instance_type = "t2.micro"
    region =  "ap-northeast-2"
    source_ami = "ami-00014daafdc4239f4"
    ssh_username = "centos"
}


provisioner "shell" {
    inline = [
        "sudo yum update -y"
        "sudo mkdir /app"
        "sudo yum install wget git -y"
        "sudo git clone -b develop https://github.com/dhdiagram4011/reservation-app-project.git /app"
        "sudo yum install python3 python3-pip"
        "sudo pip3 install -r requirements.txt"
        "sudo pip3 install Django==2.1.5"
        "sudo pip3 install djangorestframework"
    ]
}
