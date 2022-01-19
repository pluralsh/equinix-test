metadata {
  path = "grafana"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "grafana/terraform"
  target  = "grafana/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:Lmw2kgjOObG9YPzbPTwKL0Lg/KKfjJFa7HFHEROZYEI="
  retries = 0
}

step "terraform" {
  wkdir   = "grafana/terraform"
  target  = "grafana/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "grafana",
  ]

  sha     = "h1:Lmw2kgjOObG9YPzbPTwKL0Lg/KKfjJFa7HFHEROZYEI="
  retries = 0
}

step "kube-init" {
  wkdir   = "grafana"
  target  = "grafana/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "grafana",
  ]

  sha     = "434c2c901a90202733fa3be28a13746ec9a34588df5cc37c1766c11ead1599b5"
  retries = 0
}

step "helm" {
  wkdir   = "grafana/helm"
  target  = "grafana/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "grafana",
  ]

  sha     = "h1:tZ9QsgHWjBcZ10SLkqETaw7PzZtr4iNE0GswaYZJZMg="
  retries = 0
}
