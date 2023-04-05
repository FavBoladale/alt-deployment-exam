-- CREATE TYPE
DROP TYPE IF EXISTS occassion;
CREATE TYPE favevents AS ENUM (
    'Outreach',
    'Party',
    'Carnival',
    'Birthday',
    'Wedding'
);

-- CREATE TABLE
DROP TABLE IF EXISTS event;
CREATE TABLE event (
    id SERIAL PRIMARY KEY,
    tagline VARCHAR NOT NULL,
    year SMALLINT,
    occassion occassion,
    price NUMERIC(4, 1)
);