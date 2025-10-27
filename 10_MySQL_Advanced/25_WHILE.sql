#             WHILE sikl operatori
/*
  WHILE da ko'rsatilgan shart bajarilsagina uning
  tana qismidagi amallar bajariladi.
*/

#     Qolip:
/*
  [label:] WHILE search_condition DO
      statement_list
  END WHILE [label]
*/

# label - WHILE sikl nomi required - majburiy emas.

USE `test`;


DELIMITER **

DROP PROCEDURE IF EXISTS `yigindi`;
CREATE PROCEDURE yigindi()
  BEGIN
     DECLARE `counter` INT DEFAULT 1;
     DECLARE `result`  INT DEFAULT 0;

     SET `result` = 0;  -- tepada DEFAULT 0 yozilgani uchun bu qator shart emas

      loop1: WHILE `counter` <= 10 DO
          SET `result` = `result` + `counter`;
          SET `counter` = `counter` + 1;
          END WHILE loop1;

     SELECT `result`;
  END**

DELIMITER **

-- WHILE qatnashgan protsedurani chaqiramiz
CALL yigindi();

#                 Factorial ni hisoblovchi while li protsedura
DELIMITER $$
DROP PROCEDURE IF EXISTS factorial;
CREATE PROCEDURE factorial()
BEGIN
    DECLARE `i` BIGINT UNSIGNED DEFAULT 0;
    DECLARE `y` BIGINT UNSIGNED;
    DECLARE `k` BIGINT UNSIGNED DEFAULT 1;

    SET `y` = 5;

    `while_loop`: WHILE `i` < `y` DO
        SET `i` = `i` + 1;
        SET `k` = `k` * `i`;
        END WHILE `while_loop`;

    SELECT `i`, `k`;
END $$

DELIMITER ;

CALL factorial();