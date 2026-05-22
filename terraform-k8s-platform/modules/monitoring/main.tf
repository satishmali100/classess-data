resource "helm_release" "kube_prometheus_stack" {
  name      = "monitoring"
  namespace = var.namespace

  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "kube-prometheus-stack"

  create_namespace  = false
  dependency_update = true

  set = [
    {
      name  = "grafana.service.type"
      value = "NodePort"
    }
  ]
}