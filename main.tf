# main.tf

provider "local" {}

resource "null_resource" "create_cluster" {
  provisioner "local-exec" {
    command = "kind create cluster --config=kind-config.yaml"
  }
}

resource "null_resource" "configure_kubectl" {
  depends_on = [null_resource.create_cluster]

  provisioner "local-exec" {
    command = "kind get kubeconfig --name=kind > kubeconfig"
  }
}
