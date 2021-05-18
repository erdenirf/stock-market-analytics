CREATE
OR REPLACE FUNCTION create_stockanalytics_db() RETURNS void AS
$$
BEGIN
    CREATE
EXTENSION dblink;
   IF
NOT EXISTS (
      SELECT
      FROM   pg_catalog.pg_roles
      WHERE  rolname = 'stockanalytics') THEN

CREATE ROLE stockanalytics WITH SUPERUSER LOGIN PASSWORD 'stockanalytics';
END IF;
   IF
EXISTS (SELECT FROM pg_database WHERE datname = 'stockanalytics') THEN
      RAISE NOTICE 'Database already exists';
ELSE
      PERFORM dblink_exec('dbname=' || current_database()
                        , 'CREATE DATABASE stockanalytics');
END IF;
   GRANT ALL PRIVILEGES ON DATABASE
stockanalytics TO stockanalytics;
END
$$
LANGUAGE plpgsql VOLATILE;

SELECT create_stockanalytics_db();

DROP FUNCTION create_stockanalytics_db();