terraform {
  backend "local" {
    path = "../../plural-tf-state/plural-demo/bootstrap/terraform.tfstate"
  }
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.7.1"
    }
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = "~> 1.13.1"
    }
    helm = {
      source = "hashicorp/helm"
      version = ">= 2.4, <3"
    }
  }
}
provider "helm" {
  kubernetes {
    host = module.equinix-bootstrap.cluster.api_server_url
    cluster_ca_certificate = module.equinix-bootstrap.cluster.ca_crt
    client_certificate = module.equinix-bootstrap.cluster.client_cert
    client_key = module.equinix-bootstrap.cluster.client_key
  }
}

provider "kubectl" {
  host = module.equinix-bootstrap.cluster.api_server_url
  cluster_ca_certificate = module.equinix-bootstrap.cluster.ca_crt
  client_certificate = module.equinix-bootstrap.cluster.client_cert
  client_key = module.equinix-bootstrap.cluster.client_key
  load_config_file = false
}

provider "kubernetes" {
  host = module.equinix-bootstrap.cluster.api_server_url
  cluster_ca_certificate = module.equinix-bootstrap.cluster.ca_crt
  client_certificate = module.equinix-bootstrap.cluster.client_cert
  client_key = module.equinix-bootstrap.cluster.client_key
}


module "equinix-bootstrap" {
  source = "./equinix-bootstrap"

### BEGIN MANUAL SECTION <<equinix-bootstrap>>

### END MANUAL SECTION <<equinix-bootstrap>>


  auth_token = "pErgYYydoptgJ9Y3e5rAAinbfJNo2D9X"
  namespace = "bootstrap"
  project_id = "d3afa6de-dfc2-42ff-ac03-96fdb5e9f9df"
  metro = "sv"
  cluster_name = "plural-demo"
  worker_node_count_x86 = 3
  worker_node_plan_x86 = "c3.small.x86"
  

}
