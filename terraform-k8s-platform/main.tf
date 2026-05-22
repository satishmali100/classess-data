module "namespaces" {
  source = "./modules/namespaces"

  namespaces = var.namespaces
}

module "ingress" {
  source = "./modules/ingress"

  namespace = "ingress-nginx"

  depends_on = [module.namespaces]
}

module "argocd" {
  source = "./modules/argocd"

  namespace = "argocd"

  depends_on = [module.namespaces]
}

module "monitoring" {
  source = "./modules/monitoring"

  namespace = "monitoring"

  depends_on = [module.namespaces]
}