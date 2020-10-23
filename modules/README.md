# How to create a Serverless VPC access connector

This example demonstrates how to create a [Serverless VPC access connector](https://cloud.google.com/vpc/docs/configure-serverless-vpc-access).

## Usage

1. ```
   terraform init -upgrade
   ```

2. ```
   terraform apply
   ```
If you want to edit or change the variable's name, such as the Serverless VPC access connector name, just edit the `variables.tf` file and modify the variable's value.

Afterwards, if you have already initialized terraform, just run terraform apply and you will be ready to go!

## Variables

Below is the list of available variables to be used upon creation of the Serverless VPC access connector.

| Variable | Description | Default value|
| --- | --- | -- |
| [name](https://cloud.google.com/sdk/gcloud/reference/compute/networks/vpc-access/connectors/create#CONNECTOR) | (Required) The name of the resource. | -- |
| [region](https://cloud.google.com/vpc/docs/configure-serverless-vpc-access#supported_regions) | (Required) Region where the VPC Access connector resides. | us-central1 |
| [ip_cidr_range](https://cloud.google.com/sdk/gcloud/reference/compute/networks/vpc-access/connectors/create#--range) | (Required) The range of internal addresses that follows RFC 4632 notation. | -- |
| [network](https://cloud.google.com/sdk/gcloud/reference/compute/networks/vpc-access/connectors/create#--network) | (Required) Name of a VPC network. | -- |
| [min_throughput](https://cloud.google.com/sdk/gcloud/reference/compute/networks/vpc-access/connectors/create#--min-throughput) | (Optional) Minimum throughput of the connector in Mbps. | 200 |
| [max_throughput](https://cloud.google.com/sdk/gcloud/reference/compute/networks/vpc-access/connectors/create#--max-throughput) | (Optional) Maximum throughput of the connector in Mbps, must be greater than min_throughput. | 300 |

## Outputs

Once the Serverless VPC has been successfully created after running the `terraform.apply` command, the following attributes will be displayed as output:

| Output | Description |
| --- | --- |
| id | An identifier for the Serverless VPC connector with format `projects/{{project}}/locations/{{region}}/connectors/{{name}}` |
| state | State of the VPC access connector. If successful, the output should contain the line `state: READY` |
| self_link | The fully qualified name of this VPC connector |