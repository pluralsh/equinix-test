metadata {
  path = "grafana"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "grafana/terraform"
  target  = "grafana/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:Lmw2kgjOObG9YPzbPTwKL0Lg/KKfjJFa7HFHEROZYEI="
  retries = 0
}

step "terraform-apply" {
  wkdir   = "grafana/terraform"
  target  = "grafana/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:Lmw2kgjOObG9YPzbPTwKL0Lg/KKfjJFa7HFHEROZYEI="
  retries = 1
}

step "terraform-output" {
  wkdir   = "grafana"
  target  = "grafana/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
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
  ]

  sha     = "525f30eaca37b895102a982a872ea2a9e5f9e36607da646a50812d4763d0a4ae"
  retries = 0
}

step "crds" {
  wkdir   = "grafana"
  target  = "grafana/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "grafana",
  ]

  sha     = "h1:47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU="
  retries = 0
}

step "bounce" {
  wkdir   = "grafana"
  target  = "grafana/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "grafana",
  ]

  sha     = "h1:tZ9QsgHWjBcZ10SLkqETaw7PzZtr4iNE0GswaYZJZMg="
  retries = 1
}
