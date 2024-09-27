locals {
  app_name = var.branch == "main" ? "blog" : "blog-${var.branch}"
}
