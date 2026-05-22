resource "helm_release" "nginx_ingress" {
  name      = "ingress-nginx"
  namespace = var.namespace

  repository = "https://kubernetes.github.io/ingress-nginx"
  chart      = "ingress-nginx"

  create_namespace = false
}