resource "digitalocean_app" "blog" {
  spec {
    name   = "blog"
    region = var.digitalocean_ap_region

    domain {
      name = "${var.domain_shortname}.${var.domain_zone}"
      zone = var.domain_zone
    }

    static_site {
      name          = "blog"
      build_command = "git submodule update --init --recursive; hugo --destination ./public"
      output_dir    = "/public"

      git {
        repo_clone_url = "https://github.com/enbeec/blog"
        branch         = "main"
      }
    }
  }
}
