terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "<= 3.43"
    }
  }
}

provider "google" {
  project = var.project
}

module "serverless_vpc_connector" {
  source = "../serverless_vpc_connector"

  name           = var.name
  network        = var.network
  ip_cidr_range  = var.ip_cidr_range
  region         = var.region
  min_throughput = var.min_throughput
  max_throughput = var.max_throughput
  project        = var.project
}