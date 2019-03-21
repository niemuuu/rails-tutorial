# Rails tutorial
## Start with docker

### Rails new
```sh
docker-compose run web rails new . --force --database=mysql --skip-test-unit
```

### Build docker images
```sh
docker-compose build
```

### Up an app
```sh
docker-compose up -d
```

### Create DB
```sh
docker-compose exec web rails db:create
```

## Walk around the rails app (containers needs to be up)

### Execute command in rails app
```sh
docker-compose exec web ${command}
```

### Dive into container
```sh
docker-compose exec web bash
```

### Access into database
```sh
docker-compose exec db bash
mysql -u root -p # "password"
```