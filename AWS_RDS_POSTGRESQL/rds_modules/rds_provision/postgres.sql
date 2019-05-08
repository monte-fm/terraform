-- Create user and database
CREATE DATABASE mydb;
CREATE USER db_user WITH PASSWORD 'dev';
GRANT ALL PRIVILEGES ON DATABASE mydb TO db_user;
GRANT ALL PRIVILEGES ON DATABASE mydb TO db_user;

-- Monitoring user and database
CREATE USER postgres_exporter PASSWORD 'dev';
ALTER USER postgres_exporter SET SEARCH_PATH TO postgres_exporter,pg_catalog;
GRANT postgres_exporter TO nextiva;
\c postgres;
CREATE SCHEMA postgres_exporter AUTHORIZATION postgres_exporter;
CREATE VIEW postgres_exporter.pg_stat_activity
AS SELECT * from pg_catalog.pg_stat_activity;
GRANT SELECT ON postgres_exporter.pg_stat_activity TO postgres_exporter;
CREATE VIEW postgres_exporter.pg_stat_replication AS
  SELECT * from pg_catalog.pg_stat_replication;
GRANT SELECT ON postgres_exporter.pg_stat_replication TO postgres_exporter;