FROM ruby:3.1.2
ARG ROOT="/walking_lot"
ENV LANG=C.UTF-8
ENV TZ=Asia/Tokyo

WORKDIR ${ROOT}

RUN apt-get update; \
    curl -sL https://deb.nodesource.com/setup_16.x | bash -; \
    curl -Ss https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -; \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list; \
    apt-get update -qq && \
    apt-get install -y --no-install-recommends \
		  vim mariadb-client tzdata nodejs yarn

COPY Gemfile ${ROOT}
COPY Gemfile.lock ${ROOT}
COPY package.json ${ROOT}
COPY yarn.lock ${ROOT}
RUN gem install bundler
RUN bundle install --jobs 4
RUN yarn install

COPY . ${ROOT}

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Configure the main process to run when running the image
CMD ["rails", "server", "-b", "0.0.0.0"]