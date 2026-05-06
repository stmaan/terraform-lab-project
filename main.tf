resource "kubernetes_namespace" "terraform_lab" {
  metadata {
    name = var.namespace_name
    labels = {
      managed_by = "terraform"
      env        = var.env_label
    }
  }
}
