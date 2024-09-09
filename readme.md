# GeoDirectus

This is a project exploring self-hosting a CMS using Docker and PostGIS for geospatial data.

## Deploy

Run the project locally:

1. Clone the repo:
    ```bash
    git clone https://github.com/suizer98/geodirectus.git
    ```

2. cd to it and spin it up:
    ```bash
    cd geodirectus
    docker-compose up
    ```

Access the CMS at:
http://localhost:8055

## Local development

You can straightaway build the self hosting Directus using the sample postgres data in this repo. However if you need to start from scratch better to remove the sample data:

```bash
sudo rm -rf postgres/backup.sql
docker-compose down -v
docker-compose up
```

## Backing up and restoring self hosting databases

Since it is running in Docker instances, we can do below:
```bash
# Back up
docker exec -t geodirectus-postgres-1 pg_dump -U postgres postgres > postgres/backup.sql

# Restore
cat ./postgres/backup.sql | docker exec -i geodirectus-postgres-1 psql -U postgres -d postgres
```

To sneak peek to your postgres relevant settings and data, go to the volume mounted:
```bash
# Not recommended, this is just testing to override permission
sudo chmod -R 777 postgres/data
ls postgres/data
```

## Features
- Geospatial data handling via PostGIS
- Dockerised setup, allowing fully customised configuration