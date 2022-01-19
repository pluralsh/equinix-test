resource "kubernetes_namespace" "rook" {
  metadata {
    name = var.namespace
    labels = {
      "app.kubernetes.io/managed-by" = "plural"
      "app.plural.sh/name" = "rook"
    }
  }
}
