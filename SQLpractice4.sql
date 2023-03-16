create table mezunlar
(
id int,
isim varchar(40),
adres varchar(100),
diploma_notu int
);

insert into mezunlar values(1, 'Hasan Varol', 'Antalya', 90);
insert into mezunlar values(2, 'Vedat Can', 'Denizli', 75);
insert into mezunlar values(3, 'Arzu Hak', 'Burdur', 65);
insert into mezunlar values(4, 'Didem Soylu', 'Istanbul', 85);
insert into mezunlar values(5, 'Selim Bal', 'Afyon', 95);
insert into mezunlar values(6, 'Eren Haktan', 'Hatay', 100);
insert into mezunlar values(7, 'Hatice Kul', 'Antalya', 90);
select * from mezunlar;
--SORU1: mezunlar tablosundaki id ve isim sütununu listele

select id,isim from mezunlar;

--SORU2: diploma_notu 75'den büyük olan mezunların tüm bilgilerini listele

select * from mezunlar where diploma_notu>75;

--SORU3: adres'i 'Antalya' olan mezunların tüm bilgilerini listele

select * from mezunlar where adres='Antalya';



--SORU4: diploma_notu 90 ve adres'i 'Antalya' olan mezun isim'ini listele

select isim from mezunlar where diploma_notu=90 and adres='Antalya';

--SORU5: .diploma_notu 65 veya 85 olan mezunların tüm bilgilerini listele

select * from mezunlar where diploma_notu=65 or diploma_notu=85;

--2.yol
select * from mezunlar where diploma_notu in(65,85);

--SORU6: .diploma_notu 75 ve 95 arasında olan mezunların tüm bilgilerini listele

select * from mezunlar where diploma_notu between 75 and 95;

--2. yol
select * from mezunlar where diploma_notu>=75 and diploma_notu<=95;


--SORU7: .id'si 3 ve 6 arasında olmayan mezunların id, isim'ini ve diploma_notu listele

select id, isim, diploma_notu from mezunlar where id not between 3 and 6;


--2.yol
select id,isim,diploma_notu from mezunlar where id<3 or id>6;


--SORU8: diploma_notu 65 olan satırı siliniz


delete from mezunlar where diploma_notu=65;


--SORU9: adres'i 'Denizli' olan satırı siliniz

delete from mezunlar where adres='Denizli';

--SORU10: isim'i 'Didem Soylu' veya 'Selim Bal' olan satırları siliniz

delete from mezunlar where isim='Didem Soylu' or isim='Selim Bal';

--2.yol
delete from mezunlar where isim in('Didem Soylu', 'Selim Bal');

--SORU11: diploma_notu 100 den küçük olan satırları siliniz

delete from mezunlar where diploma_notu<100;


--SORU12: Tablodaki tüm verileri siliniz


delete from mezunlar;

--SORU13: mezunlar tablosunu siliniz

drop table mezunlar;

CREATE TABLE tedarikciler     
(
vergi_no int PRIMARY KEY,
sirket_ismi VARCHAR(40),
irtibat_ismi VARCHAR(30)
);
    
INSERT INTO tedarikciler VALUES (201, 'IBM', 'Kadir Şen');
INSERT INTO tedarikciler VALUES (202, 'Huawei', 'Çetin Hoş');
INSERT INTO tedarikciler VALUES (203, 'Erikson', 'Mehmet Gör');
INSERT INTO tedarikciler VALUES (204, 'Poco', 'Sedat Koc');

select * from tedarikciler;
    


CREATE TABLE urunler   
(
ted_vergino int, 
malzeme_id int, 
malzeme_isim VARCHAR(20), 
musteri_isim VARCHAR(25)
);    
    
INSERT INTO urunler VALUES(201, 1001,'Laptop', 'Aslı Can');
INSERT INTO urunler VALUES(202, 1002,'Telefon', 'Fatih Ak');
INSERT INTO urunler VALUES(202, 1003,'TV', 'Ramiz Özmen');
INSERT INTO urunler VALUES(202, 1004,'Laptop', 'Veli Tan');
INSERT INTO urunler VALUES(203, 1005,'Telefon', 'Cemile Al');
INSERT INTO urunler VALUES(204, 1006,'TV', 'Ahmet Kan');
INSERT INTO urunler VALUES(204, 1007,'Telefon', 'Ahmet Yaman');
    
select * from urunler;


--TEK EKRAN


-- SORU1: vergi_no’su 202 olan tedarikcinin 
--sirket_ismi'ni 'VivoBook' olarak güncelleyeniz.

update tedarikciler set sirket_ismi = 'VivoBook'
where vergi_no= '202';

select * from tedarikciler;


--  SORU2: tedarikciler tablosundaki tüm sirket_ismi'ni 'NOKIA' olarak güncelleyeniz.

update tedarikciler set sirket_ismi = 'NOKIA';

select * from tedarikciler;


-- SORU3: vergi_no’su 201 olan tedarikcinin 
--sirket_ismi'ni 'nokia' , irtibat_ismi’ni 'Canan Can' olarak güncelleyiniz.

update tedarikciler set sirket_ismi = 'nokia', irtibat_ismi = 'Canan Can' where vergi_no=201;

select * from tedarikciler;
    
-- SORU4: sirket_ismi nokia olan tedarikcinin
--irtibat_ismi'ni 'Bilal Han' olarak güncelleyiniz.

update tedarikciler set irtibat_ismi = 'Bilal Han' where sirket_ismi = 'nokia';

select * from tedarikciler;

-- SORU5: urunler tablosundaki 'Telefon' değerlerini,
-- 'Phone' olarak güncelleyiniz.

update urunler set malzeme_isim = 'Phone' where malzeme_isim = 'Telefon';

select * from urunler;


-- SORU6: urunler tablosundaki malzeme_id değeri 1004'ten büyük olanların,
 --malzeme_id'lerini 1 artırarak güncelleyiniz.

update urunler set malzeme_id = malzeme_id+1 where malzeme_id>1004;

select * from urunler;


-- SORU7: urunler tablosundaki tüm malzemelerin malzeme_id değerini ted_vergino ile toplayarak güncelleyiniz.

update urunler set malzeme_id = malzeme_id + ted_vergino;

select * from urunler;


-- 8. soruyu çözmeden önce, tabloları eski haline getireceğiz.

-- SORU8: urunler tablosundaki musteri_isim'i 'Ahmet Kan' olan malzeme_isim'ini,
--tedarikciler  tablosunda irtibat_ismi 'Sedat Koc' olan sirket_ismi ile güncelleyiniz.


update urunler set malzeme_isim = (select sirket_ismi from tedarikciler where irtibat_ismi='Sedat Koc') 
where musteri_isim = 'Ahmet Kan';

select * from urunler;

 -- SORU9: urunler tablosundaki malzeme_isim'i 'Laptop' olanların musteri_isim'ini,
 -- tedarikciler  tablosunda sirket_ismi 'Poco' nun irtibat_ismi ile güncelleyiniz.

 update urunler set musteri_isim = (select irtibat_ismi from tedarikciler where sirket_ismi ='Poco')
 where malzeme_isim='Laptop';


select * from urunler;


CREATE TABLE manav
(
isim varchar(50), 
yas int,
cinsiyet char,
sehir varchar(20),
gelir int,
urun_adi varchar(50), 
urun_miktar int
);

INSERT INTO manav VALUES( 'Ali', 32, 'E', 'Istanbul',10000, 'Elma', 5);
INSERT INTO manav VALUES( 'Ayse', 30, 'K', 'Ankara', 15000, 'Armut', 3);
INSERT INTO manav VALUES( 'Veli', 35, 'E', 'Izmır', 13000, 'Elma', 2);  
INSERT INTO manav VALUES( 'Hasan', 40, 'E', 'Bolu', 14000, 'Uzum', 4);  
INSERT INTO manav VALUES( 'Ali', 35, 'E', 'Ankara', 15000, 'Armut', 1);  
INSERT INTO manav VALUES( 'Ayse', 32, 'K', 'Izmır', 14000, 'Elma', 3);  
INSERT INTO manav VALUES( 'Veli', 40, 'E', 'Istanbul', 10000, 'Uzum', 5);  
INSERT INTO manav VALUES( 'Ali', 28, 'E', 'Bolu', 11000, 'Armut', 2);  
INSERT INTO manav VALUES( 'Veli', 30, 'E', 'Istanbul', 15000, 'Elma', 3);  
INSERT INTO manav VALUES( 'Ayse', 30, 'K', 'Izmır', 12000, 'Uzum', 2);

--ÇİFT EKRAN


-- SORU01: sehir'lere göre ortalama yas'ı listeleyiniz


select sehir,round(avg(yas)) as ortalama_yas 
from manav
group by sehir;

-- SORU02: sehir'lere göre kaç çalışan olduğunu listeleyiniz.


select sehir, count(isim) as calisan_sayisi
from manav 
group by sehir;

-- SORU03: cinsiyet'e göre yas ortalamasını listeleyiniz


select cinsiyet, round(avg(yas),2) as yas_ort
from manav 
group by cinsiyet;

--Soru 4 : Her sehirde ki erkek ve kız calisan sayısını bulunuz ve sehre ve cinsiyete
--göre siralayiniz.

select sehir, cinsiyet, count(*) 
from manav 
group by sehir,cinsiyet  order by sehir ,cinsiyet;


