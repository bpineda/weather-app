# README

This is an application for a job interview.

For local setup I recommend using docker, and do the following:

Clone the repo. 

```
git clone git@github.com:bpineda/weather-app.git
cd weather-app
```

Request the master.key file to be able to run the server (even locally).

Build with docker.

```
docker-compose build --no-cache
```

Run container with docker.

```
docker-compose up --remove-orphans
```

Run migrations on a different shell. Open a new shell, and type:

```
docker container ls
CONTAINER ID   IMAGE             COMMAND                  CREATED          STATUS          PORTS                    NAMES
a350c35f24e8   weather-app_app   "entrypoint.sh rails…"   22 seconds ago   Up 20 seconds   0.0.0.0:3000->3000/tcp   weather-app_app_1
```
Copy the container-id (first column), and run the migrations:

```
docker exec -it a350c35f24e8 rails db:migrate
== 20211219003144 CreateSearches: migrating ===================================
-- create_table(:searches)
   -> 0.0144s
== 20211219003144 CreateSearches: migrated (0.0145s) ==========================
```

View the running application on the browser (localhost:3000) or run the tests with the container running:

```
docker exec -it a350c35f24e8 rspec
```

The application uses the following APIs
+ https://openweathermap.org/
+ Google Geolocation services

The application uses a sqlite db that comes with Rails7. It also uses the VCR gem for mocking API calls during the tests and the Timecop gem to simulate time travel (running tests 30 minutes later).
