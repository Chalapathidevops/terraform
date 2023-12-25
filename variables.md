# Terraform variables
[Ref](https://jhooq.com/terraform-input-variables/) | [Terraform Variables](https://developer.hashicorp.com/terraform/language/values)
* Variables will give better maintainability and code reusability.
* Terraform variables are a way to store values that can be reused throughout Terraform configuration.
* They allow to define a value once and reference it in multiple places throughout configuration, making it easier to manage and update the infrastructure.
```
variable "instance_type" {
  description = "The type of EC2 instance"
  default     = "t2.micro"
  type        = "string"
}
```

## Types of Terraform Variables
There are two types of variables in Terraform
* Simple values
* Collection Variable

**Simple Values variables:** Simple Values variables are which hold only a single value. Here the types of Simple Value variables
  * string
  * number
  * bool

**Collection Variable:** In the collection variable, it consists of
  * List
  * Map
  * Set
