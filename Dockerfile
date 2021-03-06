FROM ruby:2.6.5

# RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
# RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | \
#     apt-key add -
# RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | \
#     tee /etc/apt/sources.list.d/yarn.list

# RUN apt-get update -qq \
#     && apt-get install -y build-essential nodejs yarn
# RUN gem update --system && gem install bundler -v 2.1.4
# WORKDIR /opt/wetrockpolice

# COPY Gemfile /opt/wetrockpolice
# COPY Gemfile.lock /opt/wetrockpolice
# RUN yarn install --check-files
# RUN bundle install
# COPY . /opt/wetrockpolice

# COPY entrypoint.sh /usr/bin
# RUN chmod +x /usr/bin/entrypoint.sh
# ENTRYPOINT [ "entrypoint.sh" ]

COPY entrypoint.sh /action/rails-minitest-action/entrypoint.sh
RUN chmod +x /action/rails-minitest-action/entrypoint.sh
COPY src /action/rails-minitest-action
ENTRYPOINT [ "/action/rails-minitest-action/entrypoint.sh" ]