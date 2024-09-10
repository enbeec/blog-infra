resource "digitalocean_app" "blog" {
  spec {
    name   = "blog"
    region = var.digitalocean_ap_region

    domain {
      name = "blog.valcurrie.com"
      zone = "valcurrie.com"
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
