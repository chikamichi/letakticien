FROM teezily/web-base-ruby23:0.9.21
MAINTAINER Jean-Denis Vauguet <jd@vauguet.fr>

COPY docker_scripts /docker_scripts
RUN /docker_scripts/install.sh

WORKDIR /home/app
EXPOSE 80 3000

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

COPY Gemfile /home/app/Gemfile
COPY Gemfile.lock /home/app/Gemfile.lock
RUN bundle install --jobs=4
COPY . /home/app

RUN /docker_scripts/prepare_app.sh
