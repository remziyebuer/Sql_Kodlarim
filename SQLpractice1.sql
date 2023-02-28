__student isimli bir table olusturunuz 

CREATE TABLE students (

Ogrenci_id SMALLINT,
isim VARCHAR(30),
adres VARCHAR(50),
sinav_notu SMALLINT

);


INSERT INTO students VALUES('120','Ali Can','Ankara','70');
INSERT INTO students VALUES('121','Veli Han','Trabzon','75');
INSERT INTO students VALUES('122','Ayse Tan','Bursa','85');
INSERT INTO students VALUES('123','Mary Star','Istanbul','95');
INSERT INTO students VALUES('124','Terry Star','Ankara','95');	
INSERT INTO students VALUES('125','Herry Star','Hatay','95' );
INSERT INTO students VALUES('126','Sally Otar','Izmir','100');

--Integer sütunlara yalın yada tek tırnak içinde değer girilebilir.
--Varchar sütunlara tek tırnak içinde veri girilir.

SELECT * FROM students;

__Soru 1 : students tablosunda ki id ve isim sutunlarini cagiriniz

SELECT Ogrenci_id,isim FROM students;

__Soru 2 : students tablosunda ki sinav notu 85 uzeri olan ogrenci bilgilerinin tamamini cagiriniz
__Bu Su Demek; tum sutunlari cagir ama satirlari ele.

SELECT * FROM students WHERE sinav_notu > 85 ;

__Soru 3 : Adresi Ankara olan ogrencilerin isimlerini cagiriniz.

Select isim from students where adres='Ankara';

__Soru 4 : Notu 85 uzeri ve adresi Ankara olan ogrenci isimlerini yaziniz.

select isim from students where sinav_notu >85 and adres = 'Ankara';

__Soru 5 : sinav_notu 95 ya da 70 ya da 85 e esit olan ögrencilerin tum bilgilerini cagiriniz.

select * from students where sinav_notu = 95 or sinav_notu = 70;

__2.yol;

select * from students where sinav_notu in (95,70,85); __dry kod --> dont repeat yourself(kendini tekrarlamiyor)

--Soru 6: sinav_notu 75 ve 95 arasında olan öğrencilerin isimlerini çağırınız.

select isim from students where sinav_notu>=75 and sinav_notu<=95;

__2.Yol

select isim from students where sinav_notu between 75 and 95;  __ between kullandigimiz zaman sinirlar dahildir


--Soru 7: id'si 122 ve 125 arasında olmayan öğrencilerin adreslerini yazdırınız.

select adres from students where ogrenci_id >125 or ogrenci_id < 122;__1.yol

select adres from students where ogrenci_id not between 122 and 125;__2.yol __sinirlar haric

select adres from students where ogrenci_id not in(122,123,124,125);__3.yol

--Soru 8: adres'i 'Hatay' olan satırı siliniz

delete from students where adres = 'Hatay';

select * from students;

--Soru 9: isim'i 'Ali Can' ve 'Veli Han' olan satırları(record/row) siliniz.

delete from students where isim = 'Ali Can' or isim = 'Veli Han';

__eger sildiklerimizi tekrar eklersek bu sefer en sona ekler 

delete from students where isim in ('Ali Can','Veli Han');__2.yol

delete from students; __tum satirlari siler ama table kalir

--Soru 10: id'si 123'ten büyük olan satırları siliniz.


INSERT INTO students VALUES('120','Ali Can','Ankara','70');
INSERT INTO students VALUES('121','Veli Han','Trabzon','75');
INSERT INTO students VALUES('122','Ayse Tan','Bursa','85');
INSERT INTO students VALUES('123','Mary Star','Istanbul','95');
INSERT INTO students VALUES('124','Terry Star','Ankara','95');	
INSERT INTO students VALUES('125','Herry Star','Hatay','95' );
INSERT INTO students VALUES('126','Sally Otar','Izmir','100');


select * from students;

delete from students where ogrenci_id >123;

TRUNCATE  students;--Tüm satırları geri getirilemeyecek şekilde siler. Wehere ile kullanılamaz.
--student table'ını siliniz
DROP TABLE students;
SELECT * FROM students;


















