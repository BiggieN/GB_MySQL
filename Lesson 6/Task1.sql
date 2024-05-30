USE HW_06;

-- 1. Создайте таблицу users_old, аналогичную таблице users. Создайте процедуру, с помощью которой можно переместить любого (одного) 
-- пользователя из таблицы users в таблицу users_old. (использование транзакции с выбором commit или rollback – обязательно).

DROP TABLE IF EXISTS users_old;
CREATE TABLE users_old (
	id SERIAL PRIMARY KEY,
    firstname VARCHAR(50),
    lastname VARCHAR(50),
    email VARCHAR(120) UNIQUE
);

DELIMITER //
DROP PROCEDURE IF EXISTS move_user;
CREATE PROCEDURE move_user(IN searched_user INT)
BEGIN
	INSERT INTO users_old SELECT * FROM users WHERE id = searched_user;
	DELETE FROM users WHERE id = searched_user;
	COMMIT;
END//
DELIMITER ;

CALL move_user(2);

SELECT * FROM users_old;
SELECT * FROM users;