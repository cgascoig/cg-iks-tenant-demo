
#Helm install of sample app on IKS
data "terraform_remote_state" "infra" {
  backend = "remote"
  config = {
    organization = "mel-ciscolabs-com"
    workspaces = {
      name = "cg-iks-infra-demo"
    }
  }
}

resource helm_release helloiksfrtfcb {
  name       = "helloiksapp"
  namespace = "default"
  # chart = "https://prathjan.github.io/helm-chart/helloiks-0.1.0.tgz"
  # chart = "https://github.com/prathjan/helm-chart/raw/main/helloiks-0.1.0.tgz"
  chart = "http://10.67.17.230/cgascoig/helloiks-0.1.0.tgz"

  set {
    name  = "MESSAGE"
    value = "Hello IKS from TFCB!!"
  }
}

locals {
#   kube_config = yamldecode(base64decode(data.intersight_kubernetes_cluster.iks.results[0].kube_config))
    kube_config = yamldecode(base64decode(data.terraform_remote_state.infra.outputs.kube_config))
}
