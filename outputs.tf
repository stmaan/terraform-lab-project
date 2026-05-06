output "created_namespace" {
  value = kubernetes_namespace.terraform_lab.metadata[0].name
}

output "namespace_status" {
  value = "Namespace is Active"
}
