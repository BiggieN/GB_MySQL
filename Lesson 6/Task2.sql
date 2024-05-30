-- 2. Создайте хранимую функцию hello(), которая будет возвращать приветствие, в зависимости от текущего времени суток. С 6:00 до 12:00
-- функция должна возвращать фразу "Доброе утро", с 12:00 до 18:00 функция должна возвращать фразу "Добрый день", с 18:00 до 00:00 —
-- "Добрый вечер", с 00:00 до 6:00 — "Доброй ночи".

USE lesson_4;

DELIMITER //

DROP FUNCTION IF EXISTS hello;
CREATE FUNCTION hello() RETURNS VARCHAR(12) DETERMINISTIC
BEGIN
  RETURN CASE
      WHEN CURRENT_TIME() BETWEEN '06:00:00' AND '10:59:59' THEN "Доброе утро"	
		WHEN CURRENT_TIME() BETWEEN '11:00:00' AND '14:59:59' THEN "Добрый день"	
		WHEN CURRENT_TIME() BETWEEN '15:00:00' AND '20:59:59' THEN "Добрый вечер"	
		WHEN CURRENT_TIME() BETWEEN '21:00:00' AND '05:59:59' THEN "Доброй ночи"
    END;
END //

DELIMITER ;

SELECT hello();