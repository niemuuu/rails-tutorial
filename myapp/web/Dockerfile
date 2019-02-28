# Debianがベースのrubyイメージを指定
FROM ruby:2.6.1

# 必要なものをインストール
RUN apt-get update -qq && apt-get -y install \
    build-essential \
    libpq-dev \
    nodejs \
    mysql-client \
    locales

ENV DEBIAN_FRONTEND noninteractive

# localeの指定
RUN echo "ja_JP.UTF-8 UTF-8" > /etc/locale.gen && \
    locale-gen ja_JP.UTF-8 && \
    dpkg-reconfigure locales && \
    /usr/sbin/update-locale LANG=ja_JP.UTF-8

ENV LC_ALL ja_JP.UTF-8

# rails用のディレクトリを作成
RUN mkdir /myapp

# ローカルマシン(Mac)からコンテナの中にファイルをコピー
COPY Gemfile /myapp
COPY Gemfile.lock /myapp

# 作業ディレクトリを指定
WORKDIR /myapp

# 上でコピーしたGemfileに従ってGemをインストール
RUN gem install bundler && bundle install