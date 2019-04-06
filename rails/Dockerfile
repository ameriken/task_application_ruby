FROM ruby:2.5.1
ENV LANG C.UTF-8
RUN apt-get update -qq && apt-get install -y build-essential mysql-client nodejs
RUN gem install bundler
WORKDIR /tmp
ADD Gemfile Gemfile
ADD Gemfile.lock Gemfile.lock
RUN bundle install
ENV APP_HOME /myapp
RUN mkdir -p $APP_HOME

# nodejsのインストール
RUN apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup_11.x | bash -
RUN apt-get install -y nodejs
RUN apt-get install -y build-essential
RUN npm install n -g
RUN n stable
RUN apt purge -y nodejs npm

# 最低限必要な設定
RUN apt-get install -y vim


WORKDIR $APP_HOME
ADD . $APP_HOME
EXPOSE 5000
CMD ["rails", "s", "-b", "0.0.0.0"]
