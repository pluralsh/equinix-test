metadata {
  path = "rook"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "rook/terraform"
  target  = "rook/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:FwlDEeQZ9vLM8apFMjUaTyyaAvajJ0Gc9ODDLQ4owi4="
  retries = 0
}

step "terraform-apply" {
  wkdir   = "rook/terraform"
  target  = "rook/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:FwlDEeQZ9vLM8apFMjUaTyyaAvajJ0Gc9ODDLQ4owi4="
  retries = 1
}

step "terraform-output" {
  wkdir   = "rook"
  target  = "rook/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "rook",
  ]

  sha     = "h1:FwlDEeQZ9vLM8apFMjUaTyyaAvajJ0Gc9ODDLQ4owi4="
  retries = 0
}

step "kube-init" {
  wkdir   = "rook"
  target  = "rook/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "a79bb4361fc04df595a03cf2cc9984a2998df8ee2eb77fde5658b6cc9c238020"
  retries = 0
}

step "crds" {
  wkdir   = "rook"
  target  = "rook/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "rook",
  ]

  sha     = "h1:imjDk8l0csSXggoli9Bwa5wf7erKbvCNA8XXWhlcSW4="
  retries = 0
}

step "bounce" {
  wkdir   = "rook"
  target  = "rook/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "rook",
  ]

  sha     = "h1:r9toqW/0KDQwNlPmQSM1xWyiMqm7Hz0OQbnWqmXNqHI="
  retries = 1
}
