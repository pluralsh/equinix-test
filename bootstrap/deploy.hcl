metadata {
  path = "bootstrap"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "bootstrap/terraform"
  target  = "bootstrap/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:TgutAXVfS2UCupJPzTF0airH7GzZq9sRuDAe+e6htNE="
  retries = 0
}

step "terraform-apply" {
  wkdir   = "bootstrap/terraform"
  target  = "bootstrap/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:TgutAXVfS2UCupJPzTF0airH7GzZq9sRuDAe+e6htNE="
  retries = 1
}

step "terraform-output" {
  wkdir   = "bootstrap"
  target  = "bootstrap/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "bootstrap",
  ]

  sha     = "h1:fQa5i1e+stmeJOp2TZHYy6dss6TNj+F1d18U8Z7F6Is="
  retries = 0
}

step "kube-init" {
  wkdir   = "bootstrap"
  target  = "bootstrap/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "2873d96a30a516d68e149a8f9d165357dbe9e43b4fb8775612a976a6f29742b1"
  retries = 0
}

step "crds" {
  wkdir   = "bootstrap"
  target  = "bootstrap/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "bootstrap",
  ]

  sha     = "h1:r7lkI2FXIlkFD2HoJ96LfAXG+vhx/xZ9QnqfTEe1CbI="
  retries = 0
}

step "bounce" {
  wkdir   = "bootstrap"
  target  = "bootstrap/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "bootstrap",
  ]

  sha     = "h1:A7nsE+VAXCGsN7eSKnkxLgbfAEU+zZO5RhlHqPReTkw="
  retries = 1
}
