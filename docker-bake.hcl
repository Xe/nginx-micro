variable "NGINX_VERSION" {
  default = "1.29.0"
}

group "default" {
  targets = ["nginx-micro"]
}

target "nginx-micro" {
  context = "."
  dockerfile = "Dockerfile"
  tags = [
    "ghcr.io/xe/nginx-micro:latest",
    "ghcr.io/xe/nginx-micro:v1.29.0"
  ]
  cache-from = [
    {
      type = "registry",
      ref = "ghcr.io/xe/nginx-micro"
    }
  ]
  cache-to = [ 
    {
      type = "registry",
      ref = "ghcr.io/xe/nginx-micro"
    }
  ]
  args = {
    "NGINX_VERSION" = "${NGINX_VERSION}"
  }
  platforms = [
    "linux/386",
    "linux/amd64",
    "linux/arm64",
    "linux/arm/v7",
    "linux/s390x",
    "linux/ppc64le",
    "linux/riscv64"
  ]
}
