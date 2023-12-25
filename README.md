# What is Terraform 

* Terraform is a tool for automating infrastructure provisioning (IaC)
* Using Terraform we can completely automate the setup of insfrastructure in cloud.
* Terraform supports different cloud providers (AWS, Azure, Google, etc..)
* Terraform open-source and it also have enterprise edition.
* Terraform allows you to define your desired infrastructure like servers, networks, databases, and more in a declarative configuration file called HCL (HashiCorp Configuration Language). Instead of manually clicking through a cloud provider's interface to set up resources, you write code that describes what you want your infrastructure to look like.
* Once you've written this configuration, Terraform can create, modify, and delete infrastructure resources across various cloud providers (like AWS, Azure, Google Cloud, etc.) or on-premises environments. It handles the dependencies between resources and ensures your infrastructure is created in the desired state.
* Terraform works by using its configuration file to generate an execution plan. This plan outlines all the actions it will take to reach the desired infrastructure state. When you confirm, Terraform applies these changes, bringing your actual infrastructure in line with the configuration you've specified.
* This approach makes infrastructure management more consistent, scalable, and repeatable. It also allows for versioning and collaboration through code repositories, making it easier to track changes and reproduce environments accurately.

## Architecture of Terraform

Terraform architecture mainly consists of the following components:
* Terraform Core
* Providers
* State file
  
![image](https://github.com/Chalapathidevops/terraform/assets/145283206/e0e85f9e-043f-420e-9317-c37b275020bd)


## Concepts
1. What is Terraform
2. Variables
3. tfvars
4. Locals
5. Output values
6. for-loops, for-each
7. state files
8. Provisioners
9. Modules
10. Dynamic Blocks
11. Null Resources
12. Data Source
13. Workspace
14. User-data
15. depends-on meta tag
16. Template
17. Debugging validation
18. Import
19. Upgrade
