USE `test`;

DELIMITER //

DROP PROCEDURE IF EXISTS example_proc;
CREATE PROCEDURE example_proc()
BEGIN
    DECLARE exit HANDLER FOR SQLEXCEPTION -- Обработчик ошибок (аналог CATCH)
        BEGIN
            SELECT 'Ошибка произошла!' AS message;
        END;

    -- "TRY" блок: здесь может быть код, который вызовет ошибку
    SELECT 0 / 0; -- Ошибка деления на ноль
END//

DELIMITER ;

CALL example_proc(); -- Вызов процедуры


DROP PROCEDURE IF EXISTS test_proc2;
DELIMITER //
CREATE PROCEDURE test_proc2()
BEGIN
    -- Создаём переменную для ошибки
    DECLARE error_message VARCHAR(100);

    -- Ловим ошибку и записываем текст
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
        BEGIN
            SET error_message = 'Ошибка произошла!';
            SELECT error_message; -- Выводим сообщение
        END;

    -- Ошибочный запрос (деление на 0)
    SELECT 10 / 0;
END//
DELIMITER ;

CALL test_proc2();


DELIMITER //
CREATE PROCEDURE example_proc3()
BEGIN
    DECLARE EXIT HANDLER FOR 1146 -- Таблица не существует
        BEGIN
            SELECT 'Таблица не найдена!' AS message;
        END;

    SELECT * FROM non_existing_table; -- Ошибка 1146
END;
//
DELIMITER ;

CALL example_proc3();
