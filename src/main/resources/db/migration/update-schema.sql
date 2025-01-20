ALTER TABLE orderdetails
    DROP FOREIGN KEY fk_orderdetails_orders1;

ALTER TABLE orderdetails
    DROP FOREIGN KEY fk_orderdetails_products;

ALTER TABLE orders
    DROP FOREIGN KEY fk_orders_users1;

ALTER TABLE user_roles
    DROP FOREIGN KEY fk_user_roles_users1;

ALTER TABLE products
    ADD image VARCHAR(255) NULL;

DROP TABLE orderdetails;

DROP TABLE orders;

ALTER TABLE users
    DROP COLUMN country;

ALTER TABLE users
    DROP COLUMN image_url;

ALTER TABLE products
    DROP COLUMN imageUrl;

ALTER TABLE users
    MODIFY address VARCHAR(255);

ALTER TABLE products
    MODIFY category VARCHAR(50) NULL;

ALTER TABLE users
    MODIFY city VARCHAR(255);

ALTER TABLE products
    MODIFY `description` VARCHAR(500);

ALTER TABLE products
    MODIFY `description` VARCHAR(500) NULL;

ALTER TABLE users
    MODIFY email VARCHAR(255);

ALTER TABLE users
    MODIFY email VARCHAR(255) NULL;

ALTER TABLE users
    MODIFY first_name VARCHAR(255);

ALTER TABLE users
    MODIFY last_name VARCHAR(255);

ALTER TABLE products
    MODIFY name VARCHAR(50) NULL;

ALTER TABLE users
    MODIFY password VARCHAR(255);

ALTER TABLE users
    MODIFY password VARCHAR(255) NULL;

ALTER TABLE users
    MODIFY phone VARCHAR(255);

ALTER TABLE user_roles
    MODIFY role_name VARCHAR(255);

ALTER TABLE user_roles
    MODIFY role_name VARCHAR(255) NULL;

ALTER TABLE users
    MODIFY state VARCHAR(255);

ALTER TABLE products
    MODIFY stock_quantity INT NULL;

ALTER TABLE user_roles
    MODIFY users_id INT NULL;

ALTER TABLE users
    MODIFY zip VARCHAR(255);