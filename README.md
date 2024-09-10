# Blog Infrastructure

## A Note on Pushing

You can use `github` in your spec and follow [the link in these docs]() to
authorize DO to hook into your repo's push events.

I elected to generate a 1-year token to create/update in the app platform scope.
This gets securely set as a variable in a dead simple GitHub action using cURL.
A pre-populated cURL command is provided as an output -- copy/paste should be
sufficient as it isn't typical to need to recreate the app.

You could, in theory, chain this together to create the required pipeline config
(segment). My whole idea here is that I might leave GitHub and anything with a
CI/CD that can use cURL can work with this.

```shell
curl \
    -H "Content-Type: application/json" \
    -H "Authorization: Bearer $TOKEN" \
    "https://api.digitalocean.com/v2/apps/<app_id>/deployments" \
    -XPOST \
    -d '{"force_build": true}'
```

`

## Inputs

### `digitalocean_ap_region`

The region slug for DigitalOcean App Platform. From my testing it seems that you
should remove the number from the end of the usual region slugs -- I think App
Platform just provisions to one of them based on availability.

So, for example, alongside my other resources in `nyc3` I am passing in `nyc` on
this input.

## About

I decided to publish this Terraform module just to get a feel for using
non-local modules. Keeping my root module of the Terraform config I use to run
my infrastructure in a private repo is an extra layer of protection against me
finding a way to commit  and push some kind of critical secret. It also may be
useful as an example to some trying to use Hugo on DOAP -- for whatever reason I
had to use a very specific command to initialize the theme submodule.

Lots of things are hardcoded but I don't anticpate setting up a Hugo project
again for some time so I don't mind the magic strings (including the domain I
have set up in a separate module) being in this repository instead of my private
Terraform repo.
