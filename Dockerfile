############################################################
# Dockerfile to build a base for any Ruby application
# Based on Ubuntu 14.04.
############################################################
FROM ubuntu:14.04

MAINTAINER Laurent B <lbnetid+gh@gmail.com>

# Generic locale setup
RUN locale-gen fr_FR.UTF-8
ENV LANG       fr_FR.UTF-8
ENV LC_ALL     fr_FR.UTF-8
RUN echo "LC_ALL=\"fr_FR.UTF-8\"" >> /etc/default/locale
RUN update-locale LANG=fr_FR.UTF-8

# Essential Git.
RUN apt-get install -y git ssh-client build-essential curl zlib1g-dev \
    libssl-dev libreadline-dev libyaml-dev libxml2-dev libxslt-dev
RUN apt-get clean

# Installs RBEnv system-wide in /opt
RUN git clone https://github.com/sstephenson/rbenv.git /opt/rbenv
RUN git clone https://github.com/sstephenson/ruby-build.git /opt/rbenv/plugins/ruby-build
ENV PATH /opt/rbenv/bin:/opt/rbenv/shims:$PATH
ENV RBENV_ROOT /opt/rbenv
RUN echo 'eval "$(rbenv init -)"' >> /etc/profile.d/rbenv.sh

# We don't want documentation to be generated for ruby
ENV CONFIGURE_OPTS --disable-install-doc
RUN rbenv install 2.2.2
RUN rbenv global 2.2.2
RUN rbenv rehash


