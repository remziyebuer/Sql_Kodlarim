CREATE TABLE bolumler (
      bolum_id   int PRIMARY KEY,
      bolum_isim VARCHAR(20),
      konum      VARCHAR(20)
    );
    
    INSERT INTO bolumler VALUES (10,'MUHASEBE','IST');
    INSERT INTO bolumler VALUES (20,'MUDURLUK','ANKARA');
    INSERT INTO bolumler VALUES (30,'SATIS','IZMIR');
    INSERT INTO bolumler VALUES (40,'ISLETME','BURSA');
    INSERT INTO bolumler VALUES (50,'DEPO', 'YOZGAT');

    CREATE TABLE personel (
      personel_id   int PRIMARY KEY,
      personel_isim VARCHAR(50),
      meslek        VARCHAR(15),
      mudur_id      int,
      maas          int,
      bolum_id      int
    );
    
  
    INSERT INTO personel VALUES (7369,'AHMET','KATIP',1111,800,20);
    INSERT INTO personel VALUES (7499,'BAHATTIN','SATIS',1222,1600,30);
    INSERT INTO personel VALUES (7521,'NESE','SATIS',1222,1250,30);
    INSERT INTO personel VALUES (1111,'MUZAFFER','MUDUR',7839,2975,20);
    INSERT INTO personel VALUES (7654,'MUHAMMET','SATIS',1222,1250,30);
    INSERT INTO personel VALUES (1222,'EMINE','MUDUR',7839,2850,30);
    INSERT INTO personel VALUES (1333,'HARUN','MUDUR',7839, 2450,10);
    INSERT INTO personel VALUES (7788,'MESUT','ANALIST',1111,3000,20);
    INSERT INTO personel VALUES (7839,'SEHER','BASKAN',NULL,5000,10);
    INSERT INTO personel VALUES (7844,'DUYGU','SATIS',1222,1500,30);
    INSERT INTO personel VALUES (7876,'ALI','KATIP',1111,1100,20);
    INSERT INTO personel VALUES (7900,'MERVE','KATIP',1222,950,30);
    INSERT INTO personel VALUES (7902,'NAZLI','ANALIST',1111,3000,20);
    INSERT INTO personel VALUES (7934,'EBRU','KATIP',1333,1300,10);
    INSERT INTO personel VALUES (7956,'SIBEL','MIMAR',1333,3300,60);
    INSERT INTO personel VALUES (7933,'ZEKI','MUHENDIS',1333,4300,60);
    
select * from bolumler
select * from personel
--Personel tablosundaki meslekleri listeleyiniz
SELECT meslek from personel
GROUP BY meslek;

--Personel tablosundaki meslek sayısını listeleyiniz
SELECT count(distinct meslek) as meslek_sayisi from personel; 
--NOT: Önce sütunu saydırdık sonra distinct komutu ile tekrarsiz yaptık

--Personel tablosundaki ortalama maaşı listeleyiniz
SELECT round(avg(maas),2) as ortalama_maas FROM personel

--Personel tablosunda maaşı ortalamanın altında olan isim ve maaslari listeleyiniz
--GROUP BY ve HAVING ile yapalım
SELECT personel_isim,round(avg(maas)) as ortalama_maas FROM personel
group by personel_isim
having avg(maas)<(select avg(maas) from personel);

--Personel tablosundan bolum_isim satıs olanların isim ve maaslarını listeleyiniz
select * from bolumler
select * from personel

SELECT personel_id,bolum_id,personel_isim,maas FROM personel
WHERE bolum_id in (SELECT bolum_id FROM bolumler WHERE bolum_isim='SATIS');

--Personel tablosundan bölümleri olmayan personelin isim ve mesleklerini listeleyiniz
SELECT personel_isim,meslek FROM personel 
WHERE not exists (SELECT bolum_id From bolumler WHERE personel.bolum_id=bolumler.bolum_id)

--Personel tablosundan bölümleri aynı olan personelin isim ve mesleklerini listeleyiniz
SELECT personel_isim,meslek FROM personel 
WHERE exists (SELECT bolum_id From bolumler WHERE personel.bolum_id=bolumler.bolum_id)


--Personel tablosundan maası 3000 den fazla olanlar varsa true yoksa false yazdıran bir sorgu yazınız
SELECT EXISTS(SELECT * FROM personel WHERE maas>3000);


--Personel tablosundan maası 4000 den fazla olan personelin personel_id si ve ismi ile bolumler 
--tablosunda bolum_id ve bolum isimlerini aynı sütunda yazdırınız.(7839 id -> personel SEHER) şeklinde yazdırın
SELECT personel_id||' id --> personel '||personel_isim as id_isim FROM personel WHERE maas>4000
UNION
SELECT bolum_id||' id --> bolum '||bolum_isim FROM bolumler


/* -----------------------------------------------------------------------------
  ORNEK1: SATIS ve MUHASEBE bolumlerinde calisan personelin isimlerini ve 
  bolumlerini, once bolum_isim sonra personel_isim sıralı olarak listeleyiniz
------------------------------------------------------------------------------*/ 
select * from personel

SELECT personel.personel_isim,bolumler.bolum_isim 
FROM personel inner join bolumler
ON personel.bolum_id=bolumler.bolum_id
WHERE bolum_isim in ('SATIS','MUHASEBE')
ORDER BY bolum_isim,personel_isim;



/* -----------------------------------------------------------------------------
  ORNEK2: SATIS,ISLETME ve DEPO bolumlerinde calisan personelin isimlerini,  
  bolumlerini  isim sıralı olarak listeleyiniz. 
  NOT: calisani olmasa bile bolum ismi gosterilmelidir.
------------------------------------------------------------------------------*/  
SELECT personel.personel_isim,bolumler.bolum_isim
FROM personel right join bolumler
ON personel.bolum_id=bolumler.bolum_id
WHERE bolum_isim IN ('SATIS','ISLETME','DEPO')
ORDER BY personel_isim;



/* -----------------------------------------------------------------------------
  ORNEK3: Tüm bolumlerde calisan personelin isimlerini, bolum isimlerini ve 
  maaslarini bolum ters ve maas sirali listeleyiniz. 
  NOT: calisani olmasa bile bolum ismi gosterilmelidir.
------------------------------------------------------------------------------*/  
SELECT personel.personel_isim,bolumler.bolum_isim,personel.maas
FROM personel right join bolumler
ON personel.bolum_id=bolumler.bolum_id
ORDER BY bolum_isim desc,maas asc;

/* -----------------------------------------------------------------------------
  ORNEK4: SATIS ve MUDURLUK bolumlerinde calisan personelin maaslari 2000'den 
  buyuk olanlarinin isim,bolum ve maas bilgilerini bolume ve isme gore
  siralayarak listeleyiniz.
------------------------------------------------------------------------------*/   
SELECT personel.personel_isim,bolumler.bolum_isim,personel.maas
FROM personel full join bolumler
ON personel.bolum_id=bolumler.bolum_id
WHERE bolum_isim IN ('SATIS','MUDURLUK') AND maas>2000
ORDER BY bolum_isim,personel_isim;




/* -----------------------------------------------------------------------------
  ORNEK5: MUDUR'u Harun veya Emine olan personelin bolumlerini,isimlerini,  
  maaslarini ve ayrica MUDUR isimlerini 
  (emine kimin müdürüyse onun satirinda yazsin) 
------------------------------------------------------------------------------*/ 
select * from personel

SELECT bolumler.bolum_isim,p1.personel_isim,p2.personel_isim as mudur_isim,p1.maas as personel_maas,p2.maas as mudur_maas 
FROM personel p1 INNER JOIN personel p2
ON p1.mudur_id = p2.personel_id
FULL JOIN bolumler
ON p1.bolum_id=bolumler.bolum_id
WHERE p2.personel_isim IN ('HARUN','EMINE');

--Bolumu satıs olan personelin ismine onemli kelimesi ekleyiniz
update personel set personel_isim = concat(personel_isim,' onemli')
where bolum_id=(select bolum_id from bolumler where bolum_isim='SATIS');


--VIEW KULLANIMI
CREATE VIEW isim_bolum AS
SELECT personel.personel_isim,bolumler.bolum_isim 
FROM personel inner join bolumler
ON personel.bolum_id=bolumler.bolum_id
WHERE bolum_isim in ('SATIS','MUHASEBE')
ORDER BY bolum_isim,personel_isim;

SELECT * from isim_bolum;