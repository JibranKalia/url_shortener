# README


## Setup

Ensure you have docker on your system

```
docker-compose up --build
docker-compose run web rake db:create && rake db:migrate # only on first run
```

After that navigate to either `localhost:3000`.
