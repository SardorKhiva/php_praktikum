/* FOREIGN KEY - 2 ta jadvalni 1 1 iga bog'lashda ishlatiladigan
index hisoblanadi.
   FOREIGN KEY orqali bog'lanayotgan ustunlarning tiplari
1 xil bo'lishi shart.   */


USE `mashq`;
-- 1-usul:
CREATE TABLE IF NOT EXISTS `student`
(
    `id`        INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    `name`      VARCHAR(30)  NOT NULL,
    `course_id` INT DEFAULT NULL,
    FOREIGN KEY (`course_id`)    -- shu jadvaldagi shu nomli ustun
        REFERENCES `course` (`id`) -- course jadvalidagi id ustuniga bog'lansin
);

# 2-usul: FROEIGN KEY index ga nom berish
CREATE TABLE IF NOT EXISTS `student_2`
(
    `id`        INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    `name`      VARCHAR(30)  NOT NULL,
    `course_id` INT DEFAULT NULL,
    CONSTRAINT `FK_student_c`
        FOREIGN KEY (`course_id`)
        REFERENCES `course` (`id`)
);


/*
Tushuntirish:

1. FOREIGN KEYni e'lon qilayotganda, ustun deklaratsiyasida e'lon
qilishning hojati yo'q, agar CONSTRAINT orqali alohida nom berishni rejalashtirayotgan bo'lsangiz.
2. CONSTRAINT orqali cheklovni nomlashda uning ma'noli bo'lishiga
e'tibor berish tavsiya etiladi (masalan, FK_student_c cheklov nomi "student" va "course" orasidagi bog'liqlikni bildiradi).
3. Sintaksisda noto'g'ri joylashgan FOREIGN KEY kalit so'z olib tashlandi.
*/


#       FOREIGN KEY i yo'q bo'lgan jadvaldagi ustunga FOREIGN KEY qo'shish:
ALTER TABLE `student`
    ADD FOREIGN KEY (`course_id`) REFERENCES `course` (`id`);

-- index ga nomni  o'zimiz xohlagan nom berib qo'shish:
ALTER TABLE `student`
    ADD CONSTRAINT `FK_student_c`
        FOREIGN KEY (`course_id`)
            REFERENCES `course` (`id`);

#       FOREIGN KEY ni o'chirish:
ALTER TABLE `student`
    DROP FOREIGN KEY `FK_student_c`;