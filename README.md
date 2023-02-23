# Terraform Project (IaC)
This repository contains the Terraform code for provisioning and managing infrastructure on an AWS cloud platform.

### Getting Started
To get started, you will need to have Terraform and AWS CLI installed on your local machine. 

#### Installing the AWS CLI
You can install the AWS CLI by following the instructions for your operating system on the official AWS CLI website.

Configuring the AWS CLI
Once you have installed the AWS CLI, you will need to configure it with your AWS credentials. Follow the steps below to configure the AWS CLI:

1) Open a terminal window and run the following command:
    ```
    aws configure --profile profile_name
    ```
2) Enter your AWS access key ID and secret access key when prompted. These credentials can be generated in the AWS Management Console.

3) Enter your preferred default region and output format when prompted.

#### Installing the Terraform
You can download Terraform from the official website and follow the installation instructions for your operating system.

Once Terraform is installed, clone this repository to your local machine.

Next, navigate to the directory where the repository was cloned, navigate to the respective environment folder i.e. "demo" or "dev" and create a {environment}.tfvars file. This file should contain any variables that are required for the infrastructure. An example {environment}.tfvars.template file has been provided for reference.

### Usage
To use this Terraform project, follow these steps:

1) Initialize the project by running the following command in the project directory:
    ```
    terraform init
    ```

2) Create a Terraform plan by running the following command:
    ```
    terraform plan -var-file="{environment}.tfvars"
    ```
This will show you a preview of the changes that Terraform will make to your infrastructure.

3) Apply the Terraform plan by running the following command:
   ```
   terraform apply -var-file="{environment}.tfvars"
   ```
This will apply the changes to your infrastructure.

4) Cleanup the infrastructure by running the following command:
   ```
   terraform destroy -var-file="{environment}.tfvars"
   ```

### Modules
This Terraform project is organized into modules, which are reusable units of code that can be used to provision infrastructure. Each module is contained in a separate subdirectory within the project.

### Contributing
Contributions to this project are welcome. If you notice a bug or would like to suggest an improvement, please create an issue in the issue tracker.