metadata {
  name = "rook"
}

scaffold "terraform" {
  path = "terraform"
  type = "terraform"
}

scaffold "crds" {
  path = "crds"
  type = "crd"
}

scaffold "helm" {
  path = "helm/rook"
  type = "helm"

  preflight "update-deps" {
    wkdir   = ""
    target  = "Chart.yaml"
    command = "helm"

    args = [
      "dependency",
      "update",
    ]

    sha     = "79730fe58c7b3c364abfabdf087233024add1dfbee789e7d123a1accdf8ec529"
    retries = 0
  }
}
