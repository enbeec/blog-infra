# Blog Infrastructure

## Inputs

### `digitalocean_ap_region`

The region slug for DigitalOcean App Platform. From my testing it seems that you
should remove the number from the end of the usual region slugs -- I think App
Platform just provisions to one of them based on availability.

So, for example, alongside my other resources in `nyc3` I am passing in `nyc` on this input.

## About

I decided to publish this Terraform module just to get a feel for using
non-local modules. It also may be useful as an example to some trying to use
Hugo on DOAP -- for whatever reason I had to use a very specific command to
initialize the theme submodule.
