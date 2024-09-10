output "app_id" {
  value = digitalocean_app.blog.id
}

output "force_build_curl" {
  value = <<EOT
        curl \
            -H "Content-Type: application/json" \
            -H "Authorization: Bearer $TOKEN" \
            "https://api.digitalocean.com/v2/apps/${digitalocean_app.blog.id}/deployments" \
            -XPOST \
            -d '{"force_build": true}'
        EOT
}
