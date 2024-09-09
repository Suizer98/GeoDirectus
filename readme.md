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
sudo rm -rf postgres/data
```
```bash
docker-compose down -v
sudo rm -rf postgres/data
docker-compose up
```

To sneak peek to your postgres relevant settings and data:
```bash
# Not recommended, this is just testing to override permission
sudo chmod -R 777 postgres/data
ls postgres/data
```

## Features
- Geospatial data handling via PostGIS
- Dockerised setup, allowing fully customised configuration