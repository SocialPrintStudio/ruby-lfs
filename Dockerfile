FROM ruby:2.7.4-buster

RUN apt-get install -y ca-certificates \
    && apt-get install -y libgnutls30 \
    && apt-get update 

RUN curl -L https://packagecloud.io/github/git-lfs/gpgkey | apt-key add - \
    && curl -fsSLk http://deb.nodesource.com/setup_12.x | bash \
    && apt-get install -y debian-archive-keyring apt-transport-https nodejs 
    
RUN echo "deb https://packagecloud.io/github/git-lfs/debian/ bionic main" >> /etc/apt/sources.list.d/github_git-lfs.list \
    && echo "deb-src https://packagecloud.io/github/git-lfs/debian/ bionic main" >> /etc/apt/sources.list.d/github_git-lfs.list \
    && apt-get update \
    && apt-get install -y git-lfs graphicsmagick \
    && rm -rf /var/lib/apt/lists/*
