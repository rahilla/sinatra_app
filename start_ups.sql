DROP TABLE start_ups;

CREATE TABLE start_ups
(
    id SERIAL PRIMARY KEY,
    url VARCHAR(255),
    country VARCHAR(50),
    funding INT,
    founder VARCHAR(100)
);
