# REPLACE - qo'shilayotgan ma'lumot jadvalda bor bo'lsa,
# shu qatorni butunlay qaytadan yozadi
#  Qolip:
REPLACE INTO `table_name`(`ustunlar_nomlari`)
VALUES ('qiymatlar');

REPLACE INTO `student` (`id`, `name`, `course_id`)
VALUES (2, 'Sardor', 3);

/*
 - agar id=2 qator yo'q bo'lsa, yangi ma'lumot sifatida qo'shadi,
 - agar id=2 qator bor bo'lsa, name ustuniga 'Sardor' qiymatini, course_id ustuniga 3 qiymatini yozadi
 */