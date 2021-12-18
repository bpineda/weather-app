FROM ruby:3.0.0
RUN apt-get update -qq \
&& apt-get install -y nodejs yarn vim \
&& gem install bundler
COPY . /app
COPY entrypoint.sh /usr/bin/
WORKDIR /app
RUN bundle install \
&& chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]