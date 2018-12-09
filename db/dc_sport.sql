DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS manufacturers;


CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    name VARCHAR,
    description VARCHAR,
    quantity INT,
    cost INT,
    sell_price INT,
    size INT,
    sport_type VARCHAR,
    manu_id INT REFERENCES manufacturers(id)
);

CREATE TABLE manufacturers (
    id SERIAL PRIMARY KEY,
    name VARCHAR,
    phone VARCHAR,
    country VARCHAR
);
