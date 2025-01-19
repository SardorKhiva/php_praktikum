# "department" jadvalida nechta
# ma`lumot borligini chiqaring

SHOW DATABASES;

SHOW TABLES IN Test;
SHOW TABLES IN northwind;

SELECT *
FROM Test.employees;

# menda videodarsdagi aynan "department" bazasi bo'lmagani uchun,
# boshqa bazada shu vazifani bajaraman

SELECT COUNT(*) `Employees`
FROM northwind.Employees;