provider "aws"{
    region = "ap-south-1"
}

resource "aws_instance" "example" {
    ami = "ami-0287a05f0ef0e9d9a"
    key_name = "terraform"
    instance_type = "t2.micro"
} 
