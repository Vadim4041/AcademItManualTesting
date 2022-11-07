-- 2.1
-- DROP DATABASE shop;

CREATE DATABASE shop; -- Создаем базу

USE shop;

CREATE TABLE products
(
	id INT AUTO_INCREMENT PRIMARY KEY, -- Создаем основной ключ
    name VARCHAR(100) NOT NULL,
    price DECIMAL(10, 2) NOT NULL, -- Задаем цену товара
	date DATE NOT NULL -- Даем дату каждому продукту
);

INSERT INTO products(name, price, date)
VALUES ('Хлеб', 30, '2022-12-31'),
	('Капуста', 150, '2021-12-31'),
    ('Свинина', 380, '2021-12-31'),
    ('Говядина', 450, '2020-12-31'),
    ('Виски', 900, '2020-12-31'),
	('Виноград', 350, '2019-12-31');

-- 2.2
SELECT *, DAY(date) day, MONTH(date) month, YEAR(date) year
FROM products;

-- 2.3
SELECT YEAR(date) year, COUNT(*) amountOfGoods
FROM products
GROUP BY YEAR(date);