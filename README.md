# Blog Infrastructure

## Resources

### DigitalOcean App Platform Project

The [GitHub  repo for my blog](https://github.com/enbeec/blog) is linked to an
app platform project as a plain GitHub repo. The build command pulls in the
theme submodule and populates `./public`. Super simple stuff.

I opted to go with the plain `git` source and roll something platform agnostic
for triggering new deployments on content updates.

### GitHub Environment Variable

This contains the deployment API URL derived from the project ID. If the DOAP
project is replaced for some reason, so is the variable used by the CD pipeline.

## Inputs

### `digitalocean_ap_region`

The region slug for DigitalOcean App Platform. From my testing it seems that you
should remove the number from the end of the usual region slugs -- I think App
Platform just provisions to one of them based on availability.

So, for example, alongside my other resources in `nyc3` I am passing in `nyc` on
this input.
