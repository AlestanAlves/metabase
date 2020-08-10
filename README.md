# metabase
Metabase is the easy, open source way for everyone in your company to ask questions and learn from data.

https://github.com/metabase/metabase

### Tipos de visualizações: 
Number, Progress bar, Table, Line chart, Bar chart, Row chart, Area chart, Scatterplot or bubble chart, Pie/donut chart, Funnel, Map

### Run metabase on docker

```
docker run -d -p 3000:3000 --name metabase metabase/metabase
```

### Migrating from H2 to Postgres as the Metabase application database

For general information, see instructions for migrating from H2 to MySQL or Postgres.

To migrate an existing Metabase container from an H2 application database to another database container (e.g. Postgres, MySQL), there are a few considerations to keep in mind:

    The target database container must be accessible (i.e. on an available network)
    The target database container must be supported (e.g. MySQL, Postgres)
    The existing H2 database should be mapped outside the running container

The migration process involves 2 main steps:

    Stop the existing Metabase container
    Run a new, temporary Metabase container to perform the migration

Using a Postgres container as the target, here’s an example invocation:

```
docker run --name metabase-migration \
    -v /path/metabase/data:/metabase-data \
    -e "MB_DB_FILE=/metabase-data/metabase.db" \
    -e "MB_DB_TYPE=postgres" \
    -e "MB_DB_DBNAME=metabase" \
    -e "MB_DB_PORT=5432" \
    -e "MB_DB_USER=<username>" \
    -e "MB_DB_PASS=<password>" \
    -e "MB_DB_HOST=my-database-host" \
    metabase/metabase load-from-h2
```
### Install Postgresql
```
sudo apt install postgresql postgresql-contrib
```
