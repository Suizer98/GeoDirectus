# GeoDirectus

This is a project exploring self-hosting a Directus CMS using Docker and PostGIS for geospatial data.

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
sudo rm -rf postgres/data
docker-compose down -v
docker-compose up
```

## Backing up and restoring self hosting databases

Since it is running in Docker instances, we can do below:
```bash
docker exec -t geodirectus-postgres-1 pg_dump -U postgres postgres > postgres/backup.sql
```

To restore using the `backup.sql`, we can edit `postgres/backup.sql` to avoid restoration errors:
```sql
CREATE SCHEMA IF NOT EXISTS tiger;
CREATE SCHEMA IF NOT EXISTS tiger_data;
CREATE SCHEMA IF NOT EXISTS topology;
```
Make sure we add `IF NOT EXISTS` for these 3 lines from PostGIS image.

To sneak peek to your postgres relevant settings and data, go to the volume mounted:
```bash
# Not recommended, this is just testing to override permission
sudo chmod -R 777 postgres/data
ls postgres/data
```

## Features
- Geospatial data handling via PostGIS
- Dockerised setup, allowing fully customised configuration