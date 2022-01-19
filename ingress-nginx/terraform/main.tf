terraform {
  backend "local" {
    path = "../../plural-tf-state/plural-demo/ingress-nginx/terraform.tfstate"
  }
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.7.1"
    }
  }
}
provider "helm" {
  kubernetes {
    config_path    = "../../bootstrap/terraform/kube_config_cluster.yaml"
  }
}

provider "kubernetes" {
  config_path    = "../../bootstrap/terraform/kube_config_cluster.yaml"
}


module "equinix" {
  source = "./equinix"

### BEGIN MANUAL SECTION <<equinix>>

### END MANUAL SECTION <<equinix>>


  namespace = "ingress-nginx"
  

}
