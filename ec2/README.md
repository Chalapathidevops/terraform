# Steps to create EC2 instance using Terraform

* Create a directory for your Terraform project and create a Terraform configuration file (usually named `main.tf`) in that directory. In this file, you define the AWS provider and resources you want to create. Here's a basic example:
* **Initialize Terraform:** Navigate to the directory containing your Terraform configuration files and run `terraform init` This command initializes the Terraform working directory, downloading any necessary provider plugins.
* **Apply the Configuration:** Run the `terraform apply` command to create the AWS resources defined in your Terraform configuration:
  * Terraform will display a plan of the changes it's going to make. Review the plan and type "yes" when prompted to apply it.

* **Verify Resources:** After Terraform completes the provisioning process, you can verify the resources created in the AWS Management Console or by using AWS CLI commands.

* **Destroy Resources:** If you want to remove the resources created by Terraform, you can use the following command: `terraform destroy`

**NOTE:** Be cautious when using `terraform destroy` as it will delete resources as specified in your Terraform configuration.
