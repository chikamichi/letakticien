This blog is powered by [Jekyll](https://jekyllrb.com/) and managed by [Docker](https://www.docker.com/). It leverages a fully automated workflow to build, deploy and host a static website, the lazy way.

> Access to the blog in production is obviously restricted and no one besides me shall be authorized. I'm leaving those notes available as an example of real-world Docker-based management, though. You may try to run the blog locally, and use that project as a guideline in your own tech wanderings. Have fun!

## Launching the blog locally

Simply run:

```
docker-compose up
```

The first time that command is executed, the `web` image that contains the Jekyll environment is going to be built from scratch before it is actually launched, a process that may take up to a few minutes. Next time, the container will boot the image right away.

An nginx setup serves the blog at http://letakticien.dev:3000

> Edit /etc/hosts to set up an CNAME for `letakticien.dev` -- it should point at `127.0.0.1` aka. "localhost".

### Quickly rebuilding / troubleshooting

If all that's needed is a quick rebuild, without nginx and all that jazz:

```
docker-compose run web jekyll build --watch [--trace --verbose]
```

Note that running `web` this way does *not* leverage runit. Although not a big deal in that case, to get [a clean, full-fledged one-command run](https://github.com/phusion/baseimage-docker/#running-a-one-shot-command-in-a-new-container), use:

```
docker-compose run web /sbin/my_init jekyll build --watch [--trace --verbose]
```

## Updating the blog

Do the usual [Jekyll](https://jekyllrb.com/) things, Docker will take care of reflecting that live at letakticien.dev:3000, rebuilding the content upon save.

## Deploying the blog

The blog is hosted as a Dokku app on a DigitalOcean droplet. To deploy, simply push `master` to the `production` remote:

```
git push production master
```

## SSH

In the DigitalOcean droplet:

```
ssh root@letakticien.fr
```

In the container:

```
# TODO
```

## Rebuilding the image

Delete the image and containers if any, then run `docker-compose up` again.
