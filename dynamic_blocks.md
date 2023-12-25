# How to use Terraform Dynamic blocks

* [Terraform Dynamic Block](https://developer.hashicorp.com/terraform/language/expressions/dynamic-blocks) is important when you want to create multiple resources inside of similar types, so instead of copy and pasting the same terraform configuration in the terraform file does not make sense and it is not feasible if you need to create hundreds of resources using terraform.
* If we describe terraform dynamic block in simple words then it is for loop which is going to iterate over and will help you to create a dynamic resource. With the help of dynamic blocks you can create nested repeatable blocks such as settings, ingress rules etc...

**Syntax of Dynamic Block**

Dynamic block is more or less another way to implement for loop. Here are few facts about dynamic block which you should keep in mind.

1. Collections - You need to have collections .e.g. - list, map, set
2. Iterator - To create a dynamic block you need to define an iterator.
3. Content - Content is something onto which you wanna iterate.

```
dynamic "my_dynamic_block"{
    for_each = list | map | set 
    iterator = iterator_name
    content {
        key = iterator_name.value 
    }
}
```

## How to create your first terraform dynamic block

Before we implement our first terraform dynamic block let's first see an example without dynamic block.

In this example, we are going to create two ingress rules for the aws_security_group. Both ingress rules are exactly the same apart from the port numbers .i.e. - 80 and 443. So if we do not use dynamic block then we need to create two ingress rules blocks inside the terraform file.

```
resource "aws_security_group" "main" {
   name   = "resource_without_dynamic_block"
   vpc_id = data.aws_vpc.main.id

   ingress {
      description = "ingress_rule_1"
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
   }
   
   ingress {
      description = "ingress_rule_2"
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
   }

   tags = {
      Name = "AWS security group non-dynamic block"
   }
}
```

The same terraform file can be improved by using dynamic block, now look at the following terraform file 

```
locals {
   ingress_rules = [{
      port        = 443
      description = "Ingress rules for port 443"
   },
   {
      port        = 80
      description = "Ingree rules for port 80"
   }]
}

resource "aws_security_group" "main" {
   name   = "resource_with_dynamic_block"
   vpc_id = data.aws_vpc.main.id

   dynamic "ingress" {
      for_each = local.ingress_rules

      content {
         description = ingress.value.description
         from_port   = ingress.value.port
         to_port     = ingress.value.port
         protocol    = "tcp"
         cidr_blocks = ["0.0.0.0/0"]
      }
   }

   tags = {
      Name = "AWS security group dynamic block"
   }
}
```

 if you need to define more than 2 ingress rules then using dynamic block can help you to reduce the line of code inside your terraform file.
