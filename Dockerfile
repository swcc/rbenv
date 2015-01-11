############################################################
# Dockerfile to build a base for any Ruby application
# Based on phusion/baseimage (http://phusion.github.io/baseimage-docker/).
############################################################
FROM phusion/baseimage:latest

MAINTAINER Laurent B <lbnetid+gh@gmail.com>

# Generic locale setup
RUN locale-gen fr_FR.UTF-8
ENV LANG       fr_FR.UTF-8
ENV LC_ALL     fr_FR.UTF-8
RUN echo "LC_ALL=\"fr_FR.UTF-8\"" >> /etc/default/locale
RUN update-locale LANG=fr_FR.UTF-8
ENV HOME /root
ENV DEBIAN_FRONTEND noninteractive

# Essential Git.
RUN apt-get update
RUN apt-get install -y git ssh-client build-essential curl zlib1g-dev \
    libssl-dev libreadline-dev libyaml-dev libxml2-dev libxslt-dev
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Installs RBEnv system-wide in /opt
RUN git clone https://github.com/sstephenson/rbenv.git /opt/rbenv
RUN git clone https://github.com/sstephenson/ruby-build.git /opt/rbenv/plugins/ruby-build
ENV PATH /opt/rbenv/bin:/opt/rbenv/shims:$PATH
ENV RBENV_ROOT /opt/rbenv
RUN /opt/rbenv/plugins/ruby-build/install.sh
RUN echo 'eval "$(rbenv init -)"' >> /etc/profile.d/rbenv.sh

# We don't want documentation to be generated for ruby
ENV CONFIGURE_OPTS --disable-install-doc
# Normally should do a simple
# RUN rbenv install 2.0.0-p598
# But there is a bug in readline that was supposed to be fixed by the following gist
RUN curl -fsSL https://gist.github.com/mislav/a18b9d7f0dc5b9efc162.txt | rbenv install --patch 2.0.0-p598
RUN rbenv global 2.0.0-p598
RUN rbenv rehash

# Not necessary but so cool
#RUN gem install pry bundler -N
#RUN rbenv rehash

