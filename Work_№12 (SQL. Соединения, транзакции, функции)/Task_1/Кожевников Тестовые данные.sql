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
    name VARCHAR(100) NOT NULL,		-- Задаем название товара
    price DECIMAL(10, 2) NOT NULL, -- Задаем цену товара
	categoryId INT NOT NULL,
    FOREIGN KEY (categoryId) REFERENCES categories(id)
);

DELIMITER $$
CREATE PROCEDURE insertData()
BEGIN
	DECLARE i INT DEFAULT 1;
    
	WHILE i <= 100 DO
		INSERT INTO categories(name)
		VALUES (CONCAT('category ', i));
    
		SET i = i + 1;
    END WHILE;
    
	SET i = 1;
    
    WHILE i <= 5000 DO
		INSERT INTO products(name, price, categoryId)
		VALUES (CONCAT('Goods ', i),
				FLOOR(50 + (RAND() * 100)),
				FLOOR(RAND() * (100 - 1 + 1) + 1));
    
		SET i = i + 1;
    END WHILE;	
END $$
DELIMITER ;

CALL insertData();

SELECT * FROM products;