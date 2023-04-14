DROP SCHEMA IF EXISTS schema_1;
DROP TABLE IF EXISTS hello_2;
CREATE SCHEMA schema_1;

CREATE TABLE schema_1.hello_2 (
    hello_text character varying(255) NOT NULL
);