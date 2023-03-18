
CREATE TABLE musteriler (
  musteri_id int PRIMARY KEY,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  address VARCHAR(100)
  
);

INSERT INTO musteriler (musteri_id, first_name, last_name, address)
VALUES
(10, 'Ali', 'Yılmaz', 'İstanbul'),
(20, 'Ayşe', 'Demir', 'Ankara'),
(30, 'Mehmet', 'Kara', 'İzmir'),
(40, 'Zeynep', 'Yıldız', 'Bursa'),
(50, 'Emre', 'Çelik', 'Antalya'),
(60, 'Ebru', 'Yılmaz', 'Adana'),
(70, 'Ahmet', 'Kaya', 'Mersin'),
(80, 'Ceren', 'Yılmaz', 'İstanbul, Türkiye'),
(90, 'Ali', 'Demir', 'Ankara, Türkiye');


CREATE TABLE siparisler (
  siparis_id int PRIMARY KEY,
  musteri_id INT NOT NULL ,
 siparis_tarih DATE NOT NULL,
	
	Foreign Key (musteri_id)REFERENCES musteriler(musteri_id)
)



INSERT INTO siparisler (siparis_id, musteri_id, siparis_tarih)
VALUES
(101, 80, '2022-01-01'),
(102, 50, '2022-01-02'),
(103, 30, '2022-01-03'),
(104, 50, '2022-01-04'),
(105, 40, '2022-01-05'),
(106, 30, '2022-01-06');

drop table customers; --yazdigimda hata aldim cun ki parent tablo child '
--i silmeden parent silmek istiyorsam bu kodla baglantiyi kesebilir;
ALTER TABLE orders DROP CONSTRAINT orders_customer_id_fkey;
-- constraint in ismidir sonrada silebilirim.
drop table customers;

-- Eğer "orders" tablosundaki "customer_id" sütununu da silmek isterseniz, önce "orders" tablosunu silmeniz gerekebilir.

--Ayrıca, tüm bağımlı nesneleri otomatik olarak silmek isterseniz, 
--"DROP ... CASCADE" ifadesini kullanabilirsiniz. Bu ifade ile birlikte,
--bir nesneyi silerken ona bağımlı olan tüm nesneler de otomatik olarak
--silinir. Örneğin, "customers" tablosunu silmek için aşağıdaki SQL
--sorgusunu kullanabilirsiniz:Bu sorgu, "customers" tablosunu silerken,
--bu tabloya bağımlı olan tüm nesneleri(örneğin, "orders" tablosundak 
--kısıt) de otomatik olarak siler.

select * from musteriler;

--where ile iki tablo birlestirme
--(bu inner join in aynisi oluyor)

select siparisler. * , musteriler.first_name,
musteriler.last_name from musteriler , siparisler
where siparisler.musteri_id=musteriler.musteri_id ;

select A.first_name, A.last_name, B.* from musteriler A 
inner join siparisler B
on A.musteri_id = B.musteri_id order by first_name;


--bir musteri_id tekrarli sayida gecebili burda önemli olan 
--siparis_id nin tekrarsiz girmesidir







