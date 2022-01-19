metadata {
  path = "monitoring"
  name = "deploy"
}

step "terraform-init" {
  wkdir   = "monitoring/terraform"
  target  = "monitoring/terraform"
  command = "terraform"

  args = [
    "init",
    "-upgrade",
  ]

  sha     = "h1:J5dFCWzxx2FKPdznoj5cvO1bXZiiVY6ZKJD5whN1sAM="
  retries = 0
}

step "terraform-apply" {
  wkdir   = "monitoring/terraform"
  target  = "monitoring/terraform"
  command = "terraform"

  args = [
    "apply",
    "-auto-approve",
  ]

  sha     = "h1:J5dFCWzxx2FKPdznoj5cvO1bXZiiVY6ZKJD5whN1sAM="
  retries = 1
}

step "terraform-output" {
  wkdir   = "monitoring"
  target  = "monitoring/terraform"
  command = "plural"

  args = [
    "output",
    "terraform",
    "monitoring",
  ]

  sha     = "h1:J5dFCWzxx2FKPdznoj5cvO1bXZiiVY6ZKJD5whN1sAM="
  retries = 0
}

step "kube-init" {
  wkdir   = "monitoring"
  target  = "monitoring/.plural/NONCE"
  command = "plural"

  args = [
    "wkspace",
    "kube-init",
  ]

  sha     = "8b1aaf5c6c6652211a653f7ce28ac462a3ec1e89bf037f7e400b4a54a44958ed"
  retries = 0
}

step "crds" {
  wkdir   = "monitoring"
  target  = "monitoring/crds"
  command = "plural"

  args = [
    "wkspace",
    "crds",
    "monitoring",
  ]

  sha     = "h1:x17zLJ/owkWQVZNZp1MWsv+vcv6wDMV85CsWU23xg8E="
  retries = 0
}

step "bounce" {
  wkdir   = "monitoring"
  target  = "monitoring/helm"
  command = "plural"

  args = [
    "wkspace",
    "helm",
    "monitoring",
  ]

  sha     = "h1:MPDFHQf2VYT06E/hjDG0Ik4tpM7Nmyja+F41y4MPnPs="
  retries = 1
}
