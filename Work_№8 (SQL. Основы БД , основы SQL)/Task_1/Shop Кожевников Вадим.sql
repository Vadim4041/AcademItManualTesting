-- DROP DATABASE shop;

CREATE DATABASE shop; -- Создаем базу

USE shop;

CREATE TABLE categories
(
	id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE products
(
	id INT AUTO_INCREMENT PRIMARY KEY, -- Создаем основной ключ
    name VARCHAR(100) NOT NULL,
    price DECIMAL(10, 2) NOT NULL, -- Задаем цену товара
    categoryId INT NOT NULL,
    FOREIGN KEY (categoryId) REFERENCES categories(id)
);

INSERT INTO categories(name)
VALUES ('Овощи'), ('Фрукты'), ('Хлебо-булочные изделия'), ('Мясо'), ('Алкоголь');

INSERT INTO products(name, price, categoryId)
VALUES ('Хлеб', 30, 3),
	('Капуста', 150, 1),
    ('Свинина', 380, 4),
    ('Говядина', 450, 4),
    ('Виски', 900, 5),
	('Виноград', 350, 2);

UPDATE products
SET price = price * 1.5, name = 'Огурец'
WHERE id = 2;

DELETE FROM products
WHERE price > 100;