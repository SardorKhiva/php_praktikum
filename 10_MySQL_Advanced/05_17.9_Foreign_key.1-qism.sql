/* FOREIGN KEY - 2 ta jadvalni 1 1 iga bog'lashda ishlatiladigan
index hisoblanadi.
   FOREIGN KEY orqali bog'lanayotgan ustunlarning tiplari
1 xil bo'lishi shart.   */


USE `mashq`;
-- 1-usul:
CREATE TABLE IF NOT EXISTS `student`
(
    `id`        INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `name`      VARCHAR(30)  NOT NULL,
    `course_id` INT DEFAULT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`course_id`)    -- shu jadvaldagi shu nomli ustun
        REFERENCES course (`id`) -- course jadvalidagi id ustuniga bog'lansin
);

# 2-usul: FROEIGN KEY index ga nom berish
CREATE TABLE IF NOT EXISTS `student_2`
(
    `id`        INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `name`      VARCHAR(30)  NOT NULL,
    `course_id` INT DEFAULT NULL FOREIGN KEY REFERENCES course(`id`),
    PRIMARY KEY (`id`),
    CONSTRAINT `FK_student_c` FOREIGN KEY (course_id)
        REFERENCES course (`id`)
);

#       FOREIGN KEY i yo'q bo'lgan jadvaldagi ustunga FOREIGN KEY qo'shish:
ALTER TABLE `student`
    ADD FOREIGN KEY (`course_id`) REFERENCES course (`id`);

-- index ga nomni  o'zimiz xohlagan nom berib qo'shish:
ALTER TABLE `student`
    ADD CONSTRAINT `FK_student_c`
        FOREIGN KEY (`course_id`)
            REFERENCES course (`id`);

#       FOREIGN KEY ni o'chirish:
ALTER TABLE `student`
    DROP FOREIGN KEY `FK_student_c`;