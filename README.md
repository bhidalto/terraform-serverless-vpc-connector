# Serverless VPC access connector module

This module is intended to be used to easily create Serverless VPC access connectors.

## Overview

Serverless VPC Access enables you to connect from a serverless environment on Google Cloud (Cloud Run (fully managed), Cloud Functions, or the App Engine standard environment) directly to your VPC network. This connection makes it possible for your serverless environment to access Compute Engine VM instances, Memorystore instances, and any other resources with an internal IP address.

Serverless VPC Access is based on a resource called a [connector](https://cloud.google.com/vpc/docs/configure-serverless-vpc-access#connectors). A connector handles traffic between your serverless environment and your VPC network. When you create a connector in your Google Cloud project, you attach it to a specific VPC network and region. 

You can read more about it in the official [documentation](https://cloud.google.com/vpc/docs/configure-serverless-vpc-access).

## Before you begin

- If you do not have a Google Cloud Platform project, create a new GCP project in the [Google Cloud Console](https://console.cloud.google.com) and set up billing on that project.

- [Install Terraform](https://learn.hashicorp.com/tutorials/terraform/install-cli) if you do not have it installed, as it will be needed in order to play with the modules.

## Authentication

There are two main ways to authenticate when using Terraform with the Google provider:

1. The easiest way is to authenticate using the gcloud command as follows:

```
gcloud auth application-default login
```

[Here](https://cloud.google.com/sdk/gcloud/reference/auth/application-default) you will find further information on the command specified above.

If you do not have it installed, gcloud can be installed following this [tutorial](https://cloud.google.com/sdk/docs/install).

2. For a production use-case, you will want to use service account authentication, in other words, a [service account](https://cloud.google.com/docs/authentication/getting-started).

From the service account key page in the [Cloud Console](https://console.cloud.google.com/apis/credentials/serviceaccountkey) choose an existing account, or create a new one.

Download the JSON key file. Name it something you can remember, and **store it somewhere secure on your machine.**

You supply the key to Terraform using the environment variable GOOGLE_APPLICATION_CREDENTIALS, setting the value to the location of the file, as follows:

```
export GOOGLE_APPLICATION_CREDENTIALS={{path}}
```

## Usage

1. Clone the GitHub repository by running the following command on your terminal:

```
$ git clone https://github.com/bhidalto/terraform-serverless-vpc-connector.git
```

2. Change directory to the examples folder to deploy an example Serverless VPC access connector.

```
$ cd terraform-serverless-vpc-connector/modules/examples/
```

3. Run `terraform init` to download the different modules as well as the Google provider.

4. Modify the `terraform.tfvars` file to modify the values of the variables to be passed to the module. All the info about the module and the accepted variables can be found [here](./modules/serverles_vpc_connector/README.md).

5. (Optional) Run `terraform plan` to see the different resources that will be created.

6. Run `terraform apply` to create the infrastructure within your Google Cloud Platform project.

7. Run `terraform destroy` to undeploy the resources created.