resource "helm_release" "argocd" {
  name      = "argocd"
  namespace = var.namespace

  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"

  create_namespace  = false
  dependency_update = true
}