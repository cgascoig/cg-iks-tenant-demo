
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

  chart = "http://10.67.17.230/cgascoig/helloiks-0.1.0.tgz"

  set {
    name  = "MESSAGE"
    value = "Hello IKS from TFCB!!"
  }
}

resource helm_release iwo {
  name       = "iwocollector"
  namespace = "default"

  chart = "http://10.67.17.230/cgascoig/iwok8scollector-0.6.2.tgz"
}

locals {
    kube_config = yamldecode(base64decode(data.terraform_remote_state.infra.outputs.kube_config))
}
 