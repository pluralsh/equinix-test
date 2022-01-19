metadata {
  path = "console"
  name = "diff"
}

step "terraform-init" {
  wkdir   = "console/terraform"
  target  = "console/terraform"
  command = "terraform"
  args    = ["init"]
  sha     = "h1:WhLYTTHioPaS7+GGbSX0KFTw2Iuy3f1apr3eS4KM2dA="
  retries = 0
}

step "terraform" {
  wkdir   = "console/terraform"
  target  = "console/terraform"
  command = "plural"

  args = [
    "wkspace",
    "terraform-diff",
    "console",
  ]

  sha     = "h1:WhLYTTHioPaS7+GGbSX0KFTw2Iuy3f1apr3eS4KM2dA="
  retries = 0
}

step "kube-init" {
  wkdir   = "console"
  target  = "console/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
    "console",
  ]

  sha     = "5c33ef942842c6b71b3db626a191e9d4ee8235b279912340030e003129a1b0f1"
  retries = 0
}

step "helm" {
  wkdir   = "console/helm"
  target  = "console/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm-diff",
    "console",
  ]

  sha     = "h1:8db/2IzlECA5vptHKA+Nf7j92sg1cJSX1J/US84q9ss="
  retries = 0
}
