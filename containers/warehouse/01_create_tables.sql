DROP SCHEMA IF EXISTS public;
DROP TABLE IF EXISTS hello;
CREATE SCHEMA public;

CREATE TABLE public.hello (
    hello_text character varying(255) NOT NULL
);
