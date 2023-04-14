DROP SCHEMA IF EXISTS public;
DROP TABLE IF EXISTS hello;
CREATE SCHEMA public;

CREATE TABLE public.hello_234 (
    hello_text character varying(255) NOT NULL
);