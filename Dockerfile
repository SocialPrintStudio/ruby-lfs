FROM ruby:2.6.4

RUN    curl -L https://packagecloud.io/github/git-lfs/gpgkey | apt-key add - \
    && curl -sL https://deb.nodesource.com/setup_8.x | bash - \
    && apt-get update \
    && apt-get install -y debian-archive-keyring apt-transport-https nodejs \
    && echo "deb https://packagecloud.io/github/git-lfs/debian/ jessie main" >> /etc/apt/sources.list.d/github_git-lfs.list \
    && echo "deb-src https://packagecloud.io/github/git-lfs/debian/ jessie main" >> /etc/apt/sources.list.d/github_git-lfs.list \
    && apt-get update \
    && apt-get install -y git-lfs graphicsmagick \
    && rm -rf /var/lib/apt/lists/*
