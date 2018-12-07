DROP TABLE products
DROP TABLE manufacturer


CREATE TABLE products (
    id SERIAL
    name VARCHAR
    description VARCHAR
    stock_count INT
    cost INT
    sell_price INT
)

CREATE TABLE manufacturers (
    id SERIAL
    name VARCHAR
    address VARCHAR
    country VARCHAR
    sport_type VARCHAR

)
