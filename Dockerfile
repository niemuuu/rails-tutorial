FROM ruby:2.6.1
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

ENV RAILS_DIR=/rails-dir

# RUN mkdir ${RAILS_DIR}}
WORKDIR ${RAILS_DIR}
COPY Gemfile ${RAILS_DIR}/Gemfile
COPY Gemfile.lock ${RAILS_DIR}/Gemfile.lock
RUN bundle install
COPY . ${RAILS_DIR}

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]