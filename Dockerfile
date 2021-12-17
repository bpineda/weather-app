FROM ruby:3.0.0
RUN apt-get update -qq \
&& apt-get install -y nodejs yarn \
&& gem install bundler
COPY . /app
# COPY ./bla.txt /app/bla.txt
WORKDIR /app
RUN bundle install
EXPOSE 3000
#CMD ["/usr/bin/tail","-f", "/app/bla.txt"]
CMD ["rails", "server", "-b", "0.0.0.0"]
#CMD ["/usr/bin/tail","-f", "/app/bla.txt"]