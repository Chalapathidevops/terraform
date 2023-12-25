# What is terraform provisioner
[Ref for more details](https://jhooq.com/terraform-provisioner/)
* Terraform Provisioners are used to performing certain custom actions and tasks either on the local machine or on the remote machine.
* The custom actions can vary in nature and it can be.
  * Running custom shell script on the local machine
  * Running custom shell script on the remote machine
  * Copy file to the remote machine
* Also there are two types of provisioners -
  * Generic Provisioners (file, local-exec, and remote-exec)
  * Vendor Provisioners (chef, habitat, puppet, salt-masterless)

  **Generic Provisioners** - Generally vendor independent and can be used with any cloud vendor(GCP, AWS, AZURE)

  **Vendor Provisioners** - It can only be used only with its vendor. For example, chef provisioner can only be used with chef for automating and provisioning the server configuration.

## 1. file provisioner
* As the name suggests file provisioner can be used for transferring and copying the files from one machine to another machine.
* Not only file but it can also be used for transferring/uploading the directories.
* So when we talk about copying files or directories from one machine to another machine then it has to be secured and file provisioner supports for ssh and winrm type of connections which can help you to achieve secure file transfer between the source machine and destination machine.

```
provisioner "file" {
    source      = "/home/rahul/Jhooq/keys/aws/test-file.txt"
    destination = "/home/ubuntu/test-file.txt"
} 
```
In the above code snippet, we are trying to copy file test-file.txt from its source =/home/rahul/Jhooq/keys/aws/test-file.txt to its destination =/home/ubuntu/test-file.txt

Here is the complete terraform script which demonstrates on how to use terraform file provisioner

```
provider "aws" {
   region     = "eu-central-1"
   access_key = "AKIATQ37NXBxxxxxxxxx"
   secret_key = "JzZKiCia2vjbq4zGGGewdbOhnacmxxxxxxxxxxxx"
   
}

resource "aws_instance" "ec2_example" {

    ami = "ami-0767046d1677be5a0"  
    instance_type = "t2.micro" 
    key_name= "aws_key"
    vpc_security_group_ids = [aws_security_group.main.id]

  provisioner "file" {
    source      = "/home/rahul/Jhooq/keys/aws/test-file.txt"
    destination = "/home/ubuntu/test-file.txt"
  }
  connection {
      type        = "ssh"
      host        = self.public_ip
      user        = "ubuntu"
      private_key = file("/home/rahul/Jhooq/keys/aws/aws_key")
      timeout     = "4m"
   }
}

resource "aws_security_group" "main" {
  egress = [
    {
      cidr_blocks      = [ "0.0.0.0/0", ]
      description      = ""
      from_port        = 0
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "-1"
      security_groups  = []
      self             = false
      to_port          = 0
    }
  ]
 ingress                = [
   {
     cidr_blocks      = [ "0.0.0.0/0", ]
     description      = ""
     from_port        = 22
     ipv6_cidr_blocks = []
     prefix_list_ids  = []
     protocol         = "tcp"
     security_groups  = []
     self             = false
     to_port          = 22
  }
  ]
}

resource "aws_key_pair" "deployer" {
  key_name   = "aws_key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDbvRN/gvQBhFe+dE8p3Q865T/xTKgjqTjj56p1IIKbq8SDyOybE8ia0rMPcBLAKds+wjePIYpTtRxT9UsUbZJTgF+SGSG2dC6+ohCQpi6F3xM7ryL9fy3BNCT5aPrwbR862jcOIfv7R1xVfH8OS0WZa8DpVy5kTeutsuH5FMAmEgba4KhYLTzIdhM7UKJvNoUMRBaxAqIAThqH9Vt/iR1WpXgazoPw6dyPssa7ye6tUPRipmPTZukfpxcPlsqytXWlXm7R89xAY9OXkdPPVsrQA0XFQnY8aFb9XaZP8cm7EOVRdxMsA1DyWMVZOTjhBwCHfEIGoePAS3jFMqQjGWQd rahul@rahul-HP-ZBook-15-G2"
}
```
Here is one thing to note - You need to generate the ssh keys to connect to your EC2 instance running in the AWS cloud. You can use the command ssh-keygen -t aws_key to generate the key-pair


