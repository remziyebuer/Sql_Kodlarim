/*
student_info adında bir table oluşturunuz.
student_id(PRIMARY KEY), student_name(UNIQUE), student_age(NOT NULL) ve student_dob adında sütunlar oluşturunuz.
Sütunlara uygun data tipleri ve belirtilen constraint'leri atayınız.
student_age sütunu 0-20 arası dışında değer alamaz.
student_name sütunu küçük harf karakter alamaz.
*/

CREATE TABLE student_info
(

	student_id SMALLINT PRIMARY KEY,
	student_name VARCHAR(50) UNIQUE,
	student_age SMALLINT NOT NULL,
	student_dob DATE,
	CONSTRAINT student_age_check CHECK(student_age BETWEEN 0 AND 20),
	CONSTRAINT student_name_upper_case CHECK(student_name = UPPER(student_name))
	
);


--Tüm sütunlara veri girerek 2 record oluşturunuz:

INSERT INTO student_info VALUES('101','ALI CAN', 15, '12.06.2007');
INSERT INTO student_info VALUES(102, 'VELI HAN', 19, '5.Aug.04');
INSERT INTO student_info VALUES(103, 'AYSE TAN', 16, 'Sep.3.06');
INSERT INTO student_info VALUES(104, 'KEMAL KUZU', 15, null);
INSERT INTO student_info VALUES('105', 'TOM HANKS', 20, '12-Sep-2003');
INSERT INTO student_info VALUES('106', 'ANGELINA JULIE', 10, '12-Sep-2013');
INSERT INTO student_info VALUES('107', 'BRAD PITT', 0, '10-Aug-2021');

select * from student_info;

--Spesifik iki sütuna veri giriniz: girmek zorunda oldugum satirlar null kabul etmeyenler yani
--not null ve primary key kisitlamasi olanlara kesin deger atamak zorundayim
INSERT INTO student_info(student_id, student_age) VALUES(108, 17);
INSERT INTO student_info(student_id, student_age, student_name) VALUES(109, 5, 'JOHN WALKER');

--student_id değeri 108 olan satırın student_name değerini 'LEO OCEAN' olarak güncelleyin.

update student_info set student_name = 'LEO OCEAN' where student_id = 108;

--John Walker, student_dob sütununu 11-Dec-1997 değeriyle değiştiriniz.

update student_info 
set student_dob = '11-Dec-1997'
where student_name = 'JOHN WALKER';

--105 id'li dob hücresini 11-Apr-1996 değerine ve name hücresini MARK TWAIN değerine güncelle.

update student_info
set student_dob = '11-Apr-1996' ,
student_name = 'MARK TWAIN'
where student_id ='105' ;

select * from student_info
order by student_id;

--id'si 106'dan küçük tüm student_dob değerlerini 01-Aug-2021'e güncelle.

update student_info
set student_dob = '01-Aug-2021'
where student_id <106;

--Tüm student_age değerlerini en yüksek student_age değerine güncelleyin.

update student_info
set student_age = (select max(student_age) from student_info)

--Tüm student_dob değerlerini en düşük student_dob değerine güncelleyin.

update student_info
set student_dob = (select min(student_dob) from student_info);

CREATE TABLE workers
(
worker_id SMALLINT,
worker_name VARCHAR(50),
worker_salary SMALLINT,     
CONSTRAINT worker_id_pk PRIMARY KEY(worker_id)    
);

INSERT INTO workers VALUES(101, 'Ali Can', 12000);
INSERT INTO workers VALUES(102, 'Veli Han', 2000);
INSERT INTO workers VALUES(103, 'Ayse Kan', 7000);
INSERT INTO workers VALUES(104, 'Angie Ocean', 8500);

--Veli Han'ın salary değerini en yüksek salary değerinin %20 düşüğüne yükseltin.

update workers 
set worker_salary = (select max(worker_salary)*0.8 from workers)
where worker_name  = 'Veli Han';


update workers 
set worker_salary = (select max(worker_salary) from workers)*0.8 --0.8 burdada olur
where worker_name  = 'Veli Han';

select * from workers;

--Ali Can'ın salary değerini en düşük salary değerinin %30 fazlasına düşürün.

update workers 
set worker_salary = (select min (worker_salary)from workers)*1.3
where worker_name= 'Ali Can'

--Ortalama salary değerinden düşük olan salary değerlerini 1000 artırın.
UPDATE workers
set worker_salary = worker_salary +1000
where worker_salary < (select avg(worker_salary) from workers);

select * from workers;

--Ortalama salary değerinden düşük salary değerlerine ortalama salary değeri atayın.

update workers 
set worker_salary = (select avg(worker_salary) from workers)
where worker_salary < (select avg(worker_salary) from workers)


CREATE TABLE people
(
ssn INT,
name VARCHAR(50),
address VARCHAR(80)     
);

INSERT INTO people VALUES(123456789, 'Mark Star', 'Florida');
INSERT INTO people VALUES(234567890, 'Angie Way', 'Virginia');
INSERT INTO people VALUES(345678901, 'Maryy Tien', 'New Jersey');
INSERT INTO people(ssn, address) VALUES(456789012, 'Michigan');
INSERT INTO people(ssn, address) VALUES(567890123, 'California');
INSERT INTO people(ssn, name) VALUES(567890123, 'California');


select * from people;


--null name değerlerini "To be inserted later" değerine güncelleyin.
UPDATE people
SET name = 'To be inserted later'
WHERE name IS NULL;

--null address değerlerini "To be inserted later" değerine güncelleyin.
UPDATE people
SET address = 'To be inserted later'
WHERE address IS NULL;

--İsimsiz recordları silin.
DELETE FROM people
WHERE name = 'To be inserted later';

--ssn değeri 123456789'dan büyük ve 345678901'den küçük olan recordları sil.
DELETE FROM people
WHERE ssn > 123456789 AND ssn < 345678901;

--name değeri NULL olmayan tüm recordları silin.
DELETE FROM people
WHERE name IS NOT NULL;

--address değeri Michigan olmayan kaydı siliniz
--(Java)!= ==> (SQL)<>
DELETE FROM people
WHERE address <> 'Michigan';


CREATE TABLE workers
(
    id SMALLINT,
    name VARCHAR(50),
    salary SMALLINT,
    CONSTRAINT id4_pk PRIMARY KEY(id)
);  
    
INSERT INTO workers VALUES(10001, 'Ali Can', 12000);
INSERT INTO workers VALUES(10002, 'Veli Han', 2000);
INSERT INTO workers VALUES(10003, 'Mary Star', 7000);
INSERT INTO workers VALUES(10004, 'Angie Ocean', 8500);  
INSERT INTO workers VALUES(10005, 'Angie Ocean', null);  

--En düşük ve en büyük salary değerlerine sahip recordları çağırın.
SELECT * FROM workers
WHERE salary IN((SELECT MIN(salary) FROM workers), (SELECT MAX(salary) FROM workers));

--En düşük salary değerini bulun.
SELECT MIN(salary) AS minimum_salary
FROM workers



--Record sayısını(adetini) bulun.
SELECT COUNT(*) AS satir_sayisi
FROM workers;

--Interview Question: En yüksek ikinci salary değerini çağırın.
--1. Yol:
SELECT MAX(salary) AS en_yuksek_ikinci_salary
FROM workers
WHERE salary < (SELECT MAX(salary) FROM workers);

--2. Yol:
SELECT * FROM workers ORDER BY salary DESC OFFSET 1 LIMIT 1;

--SELECT * FROM workers ORDER BY salary DESC OFFSET 1 ROW FETCH NEXT 1 ROW ONLY;


CREATE TABLE customers_likes
( 
  product_id CHAR(10),
  customer_name VARCHAR(50),
  liked_product VARCHAR(50)
);


INSERT INTO customers_likes VALUES (10, 'Mark', 'Orange');
INSERT INTO customers_likes VALUES (50, 'Mark', 'Pineapple');
INSERT INTO customers_likes VALUES (60, 'John', 'Avocado');
INSERT INTO customers_likes VALUES (30, 'Lary', 'Cherries');
INSERT INTO customers_likes VALUES (20, 'Mark', 'Apple');
INSERT INTO customers_likes VALUES (10, 'Adem', 'Orange');
INSERT INTO customers_likes VALUES (40, 'John', 'Apricot');
INSERT INTO customers_likes VALUES (20, 'Eddie', 'Apple');

--liked_product değerleri arasında Lary'nin değeri varsa customer_name değerlerini "No name" olarak güncelle.
UPDATE customers_likes
SET customer_name = 'No name'
WHERE EXISTS(SELECT liked_product FROM customers_likes WHERE customer_name = 'Lary' );


CREATE TABLE employees 
(  
  id CHAR(9), 
  name VARCHAR(50), 
  state VARCHAR(50), 
  salary SMALLINT,
  company VARCHAR(20)
);

INSERT INTO employees VALUES(123456789, 'John Walker', 'Florida', 2500, 'IBM');
INSERT INTO employees VALUES(234567890, 'Brad Pitt', 'Florida', 1500, 'APPLE');
INSERT INTO employees VALUES(345678901, 'Eddie Murphy', 'Texas', 3000, 'IBM');
INSERT INTO employees VALUES(456789012, 'Eddie Murphy', 'Virginia', 1000, 'GOOGLE');
INSERT INTO employees VALUES(567890123, 'Eddie Murphy', 'Texas', 7000, 'MICROSOFT');
INSERT INTO employees VALUES(456789012, 'Brad Pitt', 'Texas', 1500, 'GOOGLE');
INSERT INTO employees VALUES(123456710, 'Mark Stone', 'Pennsylvania', 2500, 'IBM');

SELECT * FROM employees;

CREATE TABLE companies 
(  
  company_id CHAR(9), 
  company VARCHAR(20),
  number_of_employees SMALLINT
);

INSERT INTO companies VALUES(100, 'IBM', 12000);
INSERT INTO companies VALUES(101, 'GOOGLE', 18000);
INSERT INTO companies VALUES(102, 'MICROSOFT', 10000);
INSERT INTO companies VALUES(103, 'APPLE', 21000);

SELECT * FROM companies;

--number_of_employees değeri 15000'den büyük olan name ve company değerlerini çağırın.
SELECT name, company
FROm employees
WHERE company IN(SELECT  company FROM companies WHERE number_of_employees > 15000);
