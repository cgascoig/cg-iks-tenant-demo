

provider "helm" {
  kubernetes {
    host = local.kube_config.clusters[0].cluster.server
    client_certificate = base64decode(local.kube_config.users[0].user.client-certificate-data)
    client_key = base64decode(local.kube_config.users[0].user.client-key-data)
    cluster_ca_certificate = base64decode(local.kube_config.clusters[0].cluster.certificate-authority-data)
  }
}

# terraform {
#   required_providers {
#     intersight = {
#       source = "CiscoDevNet/intersight"
#       version = "1.0.9"
#     }
#   }
# }
# provider "intersight" {
#   apikey    = var.intersight_api_key
#   secretkey = var.intersight_secretkey
#   endpoint  = var.intersight_endpoint
# }