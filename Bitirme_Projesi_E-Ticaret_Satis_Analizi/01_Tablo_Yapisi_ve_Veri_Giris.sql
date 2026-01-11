--  															 TABLOLARI OLUŞTURMA

-- Customers tablosunu oluştur.
CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100) UNIQUE,
    city VARCHAR(50),
    country VARCHAR(50),
    created_at DATE
);


-- Categories tablosunu oluştur.
CREATE TABLE categories (
    category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(50) UNIQUE
);


-- Products tablosunu oluştur.
CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(100) UNIQUE,
    category_id INT NOT NULL,
    cost_price NUMERIC(10,2),
    sale_price NUMERIC(10,2),
    stock INT,
    CONSTRAINT fk_category
        FOREIGN KEY (category_id)
        REFERENCES categories(category_id)
);


-- Orders tablosunu oluştur.
CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date TIMESTAMP,
    order_status VARCHAR(30),
    shipping_company VARCHAR(50),
    CONSTRAINT fk_customer
        FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id)
);


-- Order Items tablosunu oluştur.
CREATE TABLE order_items (
    order_item_id SERIAL PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT,
    unit_price NUMERIC(10,2),
    discount NUMERIC(5,2),
    CONSTRAINT fk_order
        FOREIGN KEY (order_id)
        REFERENCES orders(order_id),
    CONSTRAINT fk_product
        FOREIGN KEY (product_id)
        REFERENCES products(product_id),
    CONSTRAINT unique_order_product
        UNIQUE (order_id, product_id)
);

--																KATEGORİ VERİLERİNİ EKLEME

-- Categories ekleme.
INSERT INTO categories (category_name) VALUES
('Elektronik'),
('Ev Aletleri'),
('Mobilya'),
('Giyim'),
('Kozmetik'),
('Kitap'),
('Spor & Outdoor'),
('Oyuncak'),
('Ofis & Kırtasiye');

SELECT * FROM categories;


-- Customers ekleme.
INSERT INTO customers (first_name, last_name, email, city, country, created_at) 
VALUES
-- 2015: Şirket kuruluş yılı - az sayıda erken benimseyen müşteriler (6 müşteri)
('Ahmet','Yılmaz','ahmet.yilmaz1@gmail.com','İstanbul','Türkiye','2015-06-15'),
('Ayşe','Kara','ayse.kara2@gmail.com','Ankara','Türkiye','2015-08-22'),
('Mehmet','Demir','mehmet.demir3@gmail.com','İzmir','Türkiye','2015-11-30'),
('Elif','Çelik','elif.celik4@gmail.com','Bursa','Türkiye','2015-09-10'),
('Can','Koç','can.koc5@gmail.com','İstanbul','Türkiye','2015-12-05'),
('Zeynep','Arslan','zeynep.arslan6@gmail.com','Ankara','Türkiye','2015-07-18'),

-- 2016: Yavaş büyüme dönemi (8 müşteri)
('Mert','Aydın','mert.aydin7@gmail.com','İzmir','Türkiye','2016-03-12'),
('Selin','Şahin','selin.sahin8@gmail.com','İstanbul','Türkiye','2016-05-20'),
('Burak','Öztürk','burak.ozturk9@gmail.com','Bursa','Türkiye','2016-08-05'),
('Derya','Polat','derya.polat10@gmail.com','Ankara','Türkiye','2016-10-15'),
('Emre','Kılıç','emre.kilic11@gmail.com','İstanbul','Türkiye','2016-01-30'),
('Gizem','Erdoğan','gizem.erdogan12@gmail.com','İzmir','Türkiye','2016-04-22'),
('Okan','Yavuz','okan.yavuz13@gmail.com','Bursa','Türkiye','2016-07-08'),
('Melis','Aksoy','melis.aksoy14@gmail.com','Ankara','Türkiye','2016-11-25'),

-- 2017: Büyüme hızlanıyor (10 müşteri)
('Kaan','Bozkurt','kaan.bozkurt15@gmail.com','İstanbul','Türkiye','2017-02-14'),
('Ece','Kurt','ece.kurt16@gmail.com','İzmir','Türkiye','2017-04-05'),
('Serkan','Taş','serkan.tas17@gmail.com','Bursa','Türkiye','2017-06-18'),
('Pelin','Uçar','pelin.ucar18@gmail.com','Ankara','Türkiye','2017-08-30'),
('Onur','Kaplan','onur.kaplan19@gmail.com','İstanbul','Türkiye','2017-10-12'),
('Buse','Yıldız','buse.yildiz20@gmail.com','İzmir','Türkiye','2017-12-03'),
('Hakan','Çınar','hakan.cinar21@gmail.com','Bursa','Türkiye','2017-03-25'),
('Seda','Güneş','seda.gunes22@gmail.com','Ankara','Türkiye','2017-05-17'),
('Tolga','Aslan','tolga.aslan23@gmail.com','İstanbul','Türkiye','2017-07-09'),
('İrem','Bulut','irem.bulut24@gmail.com','İzmir','Türkiye','2017-09-21'),

-- 2018: Tutarlı büyüme (12 müşteri)
('Furkan','Doğan','furkan.dogan25@gmail.com','Bursa','Türkiye','2018-01-08'),
('Cansu','Eren','cansu.eren26@gmail.com','Ankara','Türkiye','2018-02-19'),
('Volkan','Keskin','volkan.keskin27@gmail.com','İstanbul','Türkiye','2018-04-11'),
('Nazlı','Toprak','nazli.toprak28@gmail.com','İzmir','Türkiye','2018-06-23'),
('Kerem','Işık','kerem.isik29@gmail.com','Bursa','Türkiye','2018-08-15'),
('Aslı','Yalçın','asli.yalcin30@gmail.com','Ankara','Türkiye','2018-10-27'),
('Barış','Mutlu','baris.mutlu31@gmail.com','İstanbul','Türkiye','2018-12-10'),
('Deniz','Öner','deniz.oner32@gmail.com','İzmir','Türkiye','2018-03-14'),
('Umut','Sezer','umut.sezer33@gmail.com','Bursa','Türkiye','2018-05-26'),
('Sinem','Koşar','sinem.kosar34@gmail.com','Ankara','Türkiye','2018-07-18'),
('Ali','Bayram','ali.bayram35@gmail.com','İstanbul','Türkiye','2018-09-30'),
('İlayda','Poyraz','ilayda.poyraz36@gmail.com','İzmir','Türkiye','2018-11-22'),

-- 2019: Hızlı büyüme (15 müşteri)
('Cem','Varol','cem.varol37@gmail.com','Bursa','Türkiye','2019-01-15'),
('Tuğçe','Korkmaz','tugce.korkmaz38@gmail.com','Ankara','Türkiye','2019-03-07'),
('Oğuz','Demirtaş','oguz.demirtas39@gmail.com','İstanbul','Türkiye','2019-05-19'),
('Yasemin','Acar','yasemin.acar40@gmail.com','İzmir','Türkiye','2019-07-02'),
('Kadir','Ergin','kadir.ergin41@gmail.com','Bursa','Türkiye','2019-08-14'),
('Nihan','Çoban','nihan.coban42@gmail.com','Ankara','Türkiye','2019-10-26'),
('Serhat','Altun','serhat.altun43@gmail.com','İstanbul','Türkiye','2019-12-08'),
('Merve','Tunç','merve.tunc44@gmail.com','İzmir','Türkiye','2019-02-20'),
('Berk','Soylu','berk.soylu45@gmail.com','Bursa','Türkiye','2019-04-12'),
('Pınar','Özkan','pinar.ozkan46@gmail.com','Ankara','Türkiye','2019-06-24'),
('Halil','Gür','halil.gur47@gmail.com','İstanbul','Türkiye','2019-09-05'),
('Esra','Kaya','esra.kaya48@gmail.com','İzmir','Türkiye','2019-11-17'),
-- 2019 - Diğer şehirlerden ilk müşteriler
('Ahsen','Kaplan','ahsen.kaplan67@gmail.com','Antalya','Türkiye','2019-02-10'),
('Kaan','Özer','kaan.ozer68@gmail.com','Antalya','Türkiye','2019-08-22'),
('Tuna','Şahin','tuna.sahin70@gmail.com','Adana','Türkiye','2019-11-05'),

-- 2020: PANDEMİ ETKİSİ - Ani artış (20 müşteri) - Homojen dağılım
('Batuhan','Şimşek','batuhan.simsek49@gmail.com','Bursa','Türkiye','2020-03-20'), -- Pandemi başlangıcı
('Leyla','Karaman','leyla.karaman50@gmail.com','Ankara','Türkiye','2020-04-05'),
('Emir','Koşkun','emir.koskun51@gmail.com','İstanbul','Türkiye','2020-04-18'),
('Sude','Acar','sude.acar52@gmail.com','İzmir','Türkiye','2020-05-10'),
('Berkay','Şen','berkay.sen53@gmail.com','İstanbul','Türkiye','2020-05-25'),
('Rabia','Kurt','rabia.kurt54@gmail.com','Ankara','Türkiye','2020-06-08'),
('Fırat','Yıldırım','firat.yildirim55@gmail.com','Antalya','Türkiye','2020-07-15'),
('Dilara','Aslan','dilara.aslan56@gmail.com','İzmir','Türkiye','2020-08-22'),
('Murat','Çetin','murat.cetin57@gmail.com','İstanbul','Türkiye','2020-09-30'),
('İpek','Demir','ipek.demir58@gmail.com','Adana','Türkiye','2020-10-12'),
('Eren','Kaya','eren.kaya59@gmail.com','Ankara','Türkiye','2020-06-05'),
('Gamze','Şimşek','gamze.simsek60@gmail.com','Bursa','Türkiye','2020-07-18'),
('Burcu','Polat','burcu.polat61@gmail.com','İstanbul','Türkiye','2020-08-25'),
('Oğulcan','Akın','ogulcan.akin62@gmail.com','İzmir','Türkiye','2020-09-10'),
('Melih','Uslu','melih.uslu63@gmail.com','Ankara','Türkiye','2020-05-15'),
('Zehra','Gök','zehra.gok64@gmail.com','Bursa','Türkiye','2020-06-20'),
('Arda','Karataş','arda.karatas65@gmail.com','İstanbul','Türkiye','2020-08-05'),
('Ceren','Erol','ceren.erol66@gmail.com','İzmir','Türkiye','2020-10-18'),
('Selma','Yavuz','selma.yavuz69@gmail.com','Ankara','Türkiye','2020-07-08'),
('Pelin','Çolak','pelin.colak71@gmail.com','İstanbul','Türkiye','2020-09-22'),

-- 2021: Pandemi sonrası yüksek seviye (18 müşteri)
('Hüseyin','Taşkın','huseyin.taskin72@gmail.com','Konya','Türkiye','2021-01-15'),
('Elvan','Dinç','elvan.dinc73@gmail.com','Konya','Türkiye','2021-03-10'),
('Mahmut','Korkmaz','mahmut.korkmaz74@gmail.com','Gaziantep','Türkiye','2021-04-25'),
('Zeliha','Önal','zeliha.onal75@gmail.com','Gaziantep','Türkiye','2021-06-18'),
('Gökhan','Bayraktar','gokhan.bayraktar76@gmail.com','Samsun','Türkiye','2021-08-05'),
('Volkan','Çebi','volkan.cebi77@gmail.com','Trabzon','Türkiye','2021-09-20'),
('Hande','Işık','hande.isik78@gmail.com','Eskişehir','Türkiye','2021-11-12'),
('Azad','Yılmaz','azad.yilmaz79@gmail.com','Diyarbakır','Türkiye','2021-12-30'),
('Selçuk','Erden','selcuk.erden80@gmail.com','Erzurum','Türkiye','2021-02-14'),
('Faruk','Öztuna','faruk.oztuna81@gmail.com','Kayseri','Türkiye','2021-05-08'),
('Levent','Arı','levent.ari82@gmail.com','Mersin','Türkiye','2021-07-22'),
('Rojda','Akbaş','rojda.akbas83@gmail.com','Van','Türkiye','2021-09-15'),
('Serdar','Gül','serdar.gul84@gmail.com','Malatya','Türkiye','2021-10-28'),
('Neslihan','Uçar','neslihan.ucar85@gmail.com','Balıkesir','Türkiye','2021-04-10'),
('Tolunay','Er','tolunay.er86@gmail.com','İstanbul','Türkiye','2021-03-05'),
('Nisa','Bulut','nisa.bulut87@gmail.com','Ankara','Türkiye','2021-06-25'),
('Kerim','Aksoy','kerim.aksoy88@gmail.com','İzmir','Türkiye','2021-08-18'),
('Beyza','Arı','beyza.ari89@gmail.com','Bursa','Türkiye','2021-10-05'),

-- 2022: Stabil büyüme (16 müşteri)
('Ulaş','Yaman','ulas.yaman90@gmail.com','İstanbul','Türkiye','2022-01-20'),
('Dilan','Öztürk','dilan.ozturk91@gmail.com','Ankara','Türkiye','2022-03-15'),
('Cihan','Sarı','cihan.sari92@gmail.com','İzmir','Türkiye','2022-05-08'),
('Serap','Güler','serap.guler93@gmail.com','Antalya','Türkiye','2022-07-22'),
('Batıkan','Demir','batikan.demir94@gmail.com','Adana','Türkiye','2022-09-10'),
('Eslem','Yüksel','eslem.yuksel95@gmail.com','İstanbul','Türkiye','2022-11-05'),
('Onat','Köse','onat.kose96@gmail.com','Ankara','Türkiye','2022-12-18'),
('İlay','Kurtuluş','ilay.kurtulus97@gmail.com','İzmir','Türkiye','2022-04-30'),
('Selin','Aydın','selin.aydin98@gmail.com','Bursa','Türkiye','2022-06-25'),
('Mete','Taş','mete.tas99@gmail.com','İstanbul','Türkiye','2022-08-12'),
('Gözde','Önal','gozde.onal100@gmail.com','Ankara','Türkiye','2022-10-28'),
('Ozan','Mutlu','ozan.mutlu101@gmail.com','İzmir','Türkiye','2022-02-14'),
('Pelin','Yalçın','pelin.yalcin102@gmail.com','Bursa','Türkiye','2022-05-20'),
('Bora','Kalkan','bora.kalkan103@gmail.com','İstanbul','Türkiye','2022-09-05'),
('Naz','Işın','naz.isin104@gmail.com','Ankara','Türkiye','2022-11-15'),
('Efe','Toprak','efe.toprak105@gmail.com','İzmir','Türkiye','2022-12-30'),

-- 2023: Yüksek performans (15 müşteri)
('İdil','Sönmez','idil.sonmez106@gmail.com','İzmir','Türkiye','2023-02-10'),
('Kerem','Deniz','kerem.deniz107@gmail.com','Ankara','Türkiye','2023-04-25'),
('Büşra','Korkut','busra.korkut108@gmail.com','İstanbul','Türkiye','2023-07-18'),
('Ahmet','Yalın','ahmet.yalin109@gmail.com','Bursa','Türkiye','2023-09-05'),
('Selda','Ekin','selda.ekin110@gmail.com','İstanbul','Türkiye','2023-11-20'),
('Furkan','Uçar','furkan.ucar111@gmail.com','Ankara','Türkiye','2023-01-15'),
('Zeynel','Aktaş','zeynel.aktas112@gmail.com','İzmir','Türkiye','2023-03-30'),
('Merve','Koçal','merve.kocal113@gmail.com','Bursa','Türkiye','2023-06-12'),
('Serhat','Çoban','serhat.coban114@gmail.com','İstanbul','Türkiye','2023-08-25'),
('Nil','Bayrak','nil.bayrak115@gmail.com','Ankara','Türkiye','2023-10-08'),
('Kaan','Öz','kaan.oz116@gmail.com','İzmir','Türkiye','2023-12-18'),
('Derya','Gül','derya.gul117@gmail.com','Bursa','Türkiye','2023-05-22'),
('Tolga','Sevinç','tolga.sevinc118@gmail.com','İstanbul','Türkiye','2023-07-30'),
('Cihan','Özdemir','cihan.ozdemir119@gmail.com','Antalya','Türkiye','2023-04-15'),
('Ebru','Karaca','ebru.karaca120@gmail.com','Adana','Türkiye','2023-09-10'),

-- 2024: Mevcut yıl - devam eden büyüme (15 müşteri)
('Mustafa','Yıldız','mustafa.yildiz121@gmail.com','Gaziantep','Türkiye','2024-01-08'),
('Dilan','Kaya','dilan.kaya122@gmail.com','Konya','Türkiye','2024-03-20'),
('Orhan','Ateş','orhan.ates123@gmail.com','İstanbul','Türkiye','2024-05-15'),
('Sümeyye','Polat','sumeyye.polat124@gmail.com','Ankara','Türkiye','2024-07-30'),
('Serdar','Koç','serdar.koc125@gmail.com','İzmir','Türkiye','2024-09-12'),
('İlayda','Gür','ilayda.gur126@gmail.com','Bursa','Türkiye','2024-11-25'),
('Okan','Turan','okan.turan127@gmail.com','Samsun','Türkiye','2024-02-18'),
('Meltem','Arslan','meltem.arslan128@gmail.com','Mersin','Türkiye','2024-04-10'),
('Kürşat','Çelik','kursat.celik129@gmail.com','İstanbul','Türkiye','2024-06-22'),
('Nazlı','Şeker','nazli.seker130@gmail.com','Ankara','Türkiye','2024-08-05'),
('Hakan','Boz','hakan.boz131@gmail.com','İzmir','Türkiye','2024-10-18'),
('Elif','Gündüz','elif.gunduz132@gmail.com','Bursa','Türkiye','2024-12-30'),
('Mert','Akın','mert.akin133@gmail.com','İstanbul','Türkiye','2024-03-05'),
('Buse','Yavuz','buse.yavuz134@gmail.com','Ankara','Türkiye','2024-06-15'),
('Alper','Kara','alper.kara135@gmail.com','İzmir','Türkiye','2024-09-28'),

-- 2025: Gelecek yıl - tahmini büyüme (6 müşteri)
('Zeynep','Işıl','zeynep.isil136@gmail.com','Bursa','Türkiye','2025-01-10'),
('Serkan','Özkan','serkan.ozkan137@gmail.com','İstanbul','Türkiye','2025-03-22'),
('Pelin','Çetin','pelin.cetin138@gmail.com','Ankara','Türkiye','2025-05-18'),
('Burak','Eren','burak.eren139@gmail.com','İzmir','Türkiye','2025-07-30'),
('Asena','Topçu','asena.topcu140@gmail.com','Antalya','Türkiye','2025-09-15');

SELECT * FROM customers;


-- Products ekleme.
INSERT INTO products (product_name, category_id, cost_price, sale_price, stock) VALUES
-- Elektronik (category_id: 1)
('Laptop Pro 14', 1, 18000, 24000, 45),
('Laptop Air 13', 1, 15000, 20000, 32),
('Gaming Laptop X', 1, 22000, 30000, 18),
('Bluetooth Kulaklık A1', 1, 600, 1200, 120),
('Bluetooth Kulaklık A2', 1, 800, 1500, 95),
('Kablosuz Mouse', 1, 300, 650, 200),
('Mekanik Klavye', 1, 1200, 2200, 78),
('27 İnç Monitör', 1, 5000, 7500, 42),
('Akıllı Telefon S', 1, 14000, 21000, 55),
('Akıllı Telefon Pro', 1, 18000, 26000, 28),
('Tablet Plus 11', 1, 7800, 11800, 37),
('Kulak Üstü Kulaklık', 1, 2100, 3900, 64),
('Akıllı Ev Kamerası', 1, 1600, 2900, 82),
('Type-C Şarj Aleti', 1, 350, 750, 150),
('Powerbank Slim', 1, 700, 1400, 110),
('Gaming Kulaklık Pro', 1, 2600, 4800, 46),
('SSD 1TB', 1, 2400, 4200, 88),
('Mini Projektör', 1, 3200, 5900, 25),
('Akıllı Ampul', 1, 420, 900, 175),

-- Ev Aletleri (category_id: 2)
('Filtre Kahve Makinesi', 2, 2500, 4200, 52),
('Espresso Makinesi', 2, 6000, 9800, 22),
('Elektrikli Süpürge', 2, 4500, 7800, 38),
('Airfryer', 2, 3500, 5900, 41),
('Su Isıtıcı', 2, 900, 1600, 96),
('Mikrodalga Fırın', 2, 4000, 6500, 29),
('Blender Seti', 2, 2200, 3900, 67),
('Ütü', 2, 1800, 3200, 73),
('Mini Fırın', 2, 3000, 5200, 34),
('Bulaşık Makinesi', 2, 11000, 16500, 15),
('Dikey Buharlı Ütü', 2, 2600, 4800, 28),
('Mutfak Robotu', 2, 5200, 8900, 19),
('Mini Kahve Öğütücü', 2, 1800, 3400, 44),
('Elektrikli Izgara Pro', 2, 3100, 5600, 31),
('Akıllı Tartı', 2, 900, 1700, 89),

-- Mobilya (category_id: 3)
('Ofis Sandalyesi', 3, 3500, 6500, 24),
('Oyuncu Koltuğu', 3, 5500, 9800, 16),
('Çalışma Masası', 3, 4000, 7200, 21),
('TV Ünitesi', 3, 6000, 10500, 18),
('Kitaplık', 3, 2800, 4900, 32),
('Yemek Masası', 3, 9000, 15000, 12),
('Yemek Sandalyesi', 3, 2200, 3900, 45),
('Komodin', 3, 1800, 3200, 37),
('Gardırop', 3, 14000, 23000, 8),
('Şifonyer', 3, 7500, 12500, 14),
('Yan Sehpa', 3, 3600, 6400, 26),
('Çocuk Kitaplığı', 3, 4200, 7600, 19),
('Puf Koltuk', 3, 2800, 5200, 33),

-- Giyim (category_id: 4)
('Spor Ayakkabı', 4, 1800, 3500, 68),
('Koşu Ayakkabısı', 4, 2200, 4200, 52),
('Mont', 4, 3500, 6500, 37),
('Kazak', 4, 1200, 2200, 85),
('Tişört', 4, 500, 1100, 120),
('Pantolon', 4, 1400, 2600, 74),
('Sweatshirt', 4, 1600, 2900, 63),
('Elbise', 4, 2500, 4800, 42),
('Ceket', 4, 4200, 7800, 28),
('Spor Çanta', 4, 1800, 3300, 56),
('Kot Pantolon', 4, 1900, 3600, 47),
('Oversize Tişört', 4, 650, 1300, 92),
('Rüzgarlık', 4, 2800, 5200, 34),
('Keten Gömlek', 4, 1700, 3200, 58),
('Spor Çorap Seti', 4, 350, 800, 140),
('Polar Sweatshirt', 4, 2100, 3900, 45),
('Şişme Yelek', 4, 3000, 5600, 31),

-- Kozmetik (category_id: 5)
('Yüz Temizleme Jeli', 5, 250, 520, 156),
('Nemlendirici Krem', 5, 400, 780, 132),
('Güneş Kremi SPF50', 5, 450, 850, 118),
('Şampuan', 5, 220, 480, 172),
('Saç Kremi', 5, 260, 520, 165),
('Yüz Maskesi Seti', 5, 350, 750, 142),
('Vücut Losyonu', 5, 420, 820, 128),
('Dudak Balmı', 5, 180, 420, 185),
('Saç Serumu', 5, 550, 1100, 96),
('Parfüm Kadın', 5, 900, 1800, 74),
('Parfüm Erkek', 5, 950, 1900, 68),
('Makyaj Seti', 5, 1200, 2400, 52),

-- Kitap (category_id: 6)
('Roman – Modern Klasik', 6, 120, 260, 210),
('Kişisel Gelişim Kitabı', 6, 140, 300, 185),
('Veri Analizi Kitabı', 6, 220, 420, 132),
('SQL Öğreniyorum', 6, 180, 360, 156),
('Power BI Rehberi', 6, 240, 460, 142),
('Çocuk Masal Kitabı', 6, 90, 190, 245),
('Bilim Kurgu Roman', 6, 160, 330, 168),
('Tarih Kitabı', 6, 200, 390, 152),
('Python Programlama', 6, 260, 480, 138),
('Veri Bilimi 101', 6, 280, 520, 124),
('Finans Okuryazarlığı', 6, 220, 420, 148),
('Girişimcilik Kitabı', 6, 200, 390, 156),
('Psikolojiye Giriş', 6, 240, 460, 142),
('İş Analizi Rehberi', 6, 260, 480, 136),

-- Spor & Outdoor (category_id: 7)
('Yoga Matı', 7, 450, 850, 88),
('Dambıl Seti', 7, 1800, 3200, 42),
('Koşu Bandı', 7, 22000, 34000, 8),
('Bisiklet Kaskı', 7, 900, 1600, 56),
('Spor Saati', 7, 3800, 7200, 34),
('Sırt Çantası Outdoor', 7, 1200, 2400, 62),
('Çadır 4 Kişilik', 7, 6500, 11500, 18),
('Uyku Tulumu', 7, 2800, 5200, 26),
('Pilates Topu', 7, 450, 900, 94),
('Kamp Ocağı', 7, 1600, 3000, 38),
('Termos 1L', 7, 900, 1800, 72),
('Spor Eldiveni', 7, 350, 750, 102),

-- Oyuncak (category_id: 8)
('Lego Yapı Seti', 8, 1200, 2400, 52),
('Uzaktan Kumandalı Araba', 8, 1800, 3400, 38),
('Peluş Ayı', 8, 350, 750, 96),
('Zeka Oyunu', 8, 600, 1200, 68),
('Oyuncak Mutfak Seti', 8, 1400, 2800, 42),
('Ahşap Puzzle', 8, 600, 1200, 74),
('Puzzle 1000 Parça', 8, 420, 850, 82),
('Oyuncak Bebek', 8, 800, 1600, 58),
('Ahşap Oyuncak Seti', 8, 900, 1800, 46),
('Eğitici Tablet', 8, 2500, 4800, 28),

-- Ofis & Kırtasiye (category_id: 9)
('Dizüstü Defter', 9, 120, 260, 185),
('Laptop Çantası', 9, 1200, 2400, 56),
('Masaüstü Saat', 9, 650, 1300, 72),
('Not Kağıdı Seti', 9, 180, 420, 142),
('Kalem Seti', 9, 180, 360, 165),
('Ofis Sandalyesi Pro', 9, 7200, 12500, 14),
('Yazıcı', 9, 6500, 11500, 22),
('Masa Lambası LED', 9, 750, 1400, 68),
('Dosya Dolabı', 9, 4800, 8500, 18),
('Ajanda', 9, 200, 420, 128),
('Beyaz Tahta', 9, 2200, 3900, 34);

SELECT * FROM products;
TRUNCATE TABLE orders RESTART IDENTITY CASCADE;


-- Orders tablosuna veri ekleme
WITH sipariş_verileri AS (
    -- Yıllara göre sipariş sayıları
    SELECT yil, siparis_sayisi, ay FROM (
        VALUES 
            (2015, 8, NULL),
            (2016, 12, NULL),
            (2017, 18, NULL),
            (2018, 22, NULL),
            (2019, 38, NULL),
            (2020, 55, NULL),
            (2021, 50, NULL),
            (2022, 46, NULL),
            (2023, 48, NULL),
            (2024, 69, NULL),
            (2025, 61, NULL),  -- Ocak-Kasım
            (2025, 13, 12)      -- Aralık
    ) AS t(yil, siparis_sayisi, ay)
)
INSERT INTO orders (customer_id, order_date, order_status, shipping_company)
SELECT 
    -- Rastgele müşteri ID (1-140 arası)
    FLOOR(RANDOM() * 140) + 1 as customer_id,
    
    -- Sipariş tarihi oluşturma
    CASE 
        WHEN yil = 2025 AND ay = 12 THEN 
            TIMESTAMP '2025-12-01' + RANDOM() * INTERVAL '30 days'
        WHEN yil = 2025 THEN 
            TIMESTAMP '2025-01-01' + RANDOM() * INTERVAL '334 days'
        ELSE 
            DATE_TRUNC('year', MAKE_DATE(yil, 1, 1)) + RANDOM() * INTERVAL '364 days'
    END as order_date,
    
    -- Sipariş durumu belirleme
    CASE 
        -- 2025 Aralık özel dağılımı
        WHEN yil = 2025 AND ay = 12 THEN 
            CASE 
                WHEN RANDOM() < 0.25 THEN 'Pending'
                WHEN RANDOM() < 0.40 THEN 'Processing'
                WHEN RANDOM() < 0.55 THEN 'Shipped'
                WHEN RANDOM() < 0.90 THEN 'Delivered'
                WHEN RANDOM() < 0.95 THEN 'Cancelled'
                ELSE 'Returned'
            END
        -- Diğer tüm zamanlar için standart dağılım
        ELSE 
            CASE 
                WHEN RANDOM() < 0.80 THEN 'Delivered'
                WHEN RANDOM() < 0.95 THEN 'Returned'
                ELSE 'Cancelled'
            END
    END as order_status,
    
    -- Kargo şirketi (homojen dağılım)
    CASE FLOOR(RANDOM() * 4)
        WHEN 0 THEN 'Aras Kargo'
        WHEN 1 THEN 'MNG Kargo'
        WHEN 2 THEN 'Yurtiçi Kargo'
        ELSE 'Sürat Kargo'
    END as shipping_company

FROM sipariş_verileri,
LATERAL GENERATE_SERIES(1, sipariş_verileri.siparis_sayisi);

-- Toplam sipariş sayısı
SELECT COUNT(*) AS toplam_sipariş FROM orders;
select * from orders;

-- Yıllara göre sipariş dağılımı
SELECT 
    EXTRACT(YEAR FROM order_date) AS yıl,
    COUNT(*) AS sipariş_sayısı
FROM orders
GROUP BY EXTRACT(YEAR FROM order_date)
ORDER BY yıl;


-- Order Items tablosuna veri ekleme
-- Önce order_items tablosunu temizleyelim
TRUNCATE TABLE order_items;

-- Her sipariş için 1-5 arasında ürün ekleyelim
INSERT INTO order_items (order_id, product_id, quantity, unit_price, discount)
WITH sipariş_ürün_sayısı AS (
    -- Her sipariş için rastgele 1-5 arası ürün sayısı belirle
    SELECT 
        order_id,
        FLOOR(RANDOM() * 5 + 1)::INT as ürün_sayısı
    FROM orders
),
sipariş_ürünleri AS (
    -- Her sipariş için rastgele ürünler seç
    SELECT 
        s.order_id,
        p.product_id,
        p.category_id,
        p.sale_price,
        ROW_NUMBER() OVER (PARTITION BY s.order_id ORDER BY RANDOM()) as sıra
    FROM sipariş_ürün_sayısı s
    CROSS JOIN products p
)
SELECT 
    su.order_id,
    su.product_id,
    -- Kategoriye göre mantıklı miktar belirle
    CASE 
        -- Elektronik, Ev Aletleri, Mobilya: Genellikle 1 adet
        WHEN su.category_id IN (1, 2, 3) THEN 
            CASE 
                WHEN su.category_id = 1 AND RANDOM() < 0.1 THEN 2  -- Elektronik aksesuarlar için bazen 2
                WHEN su.category_id = 2 AND RANDOM() < 0.05 THEN 2 -- Ev aletleri için nadiren 2
                ELSE 1
            END
        -- Giyim, Kozmetik, Kitap: 1-3 arası
        WHEN su.category_id IN (4, 5, 6) THEN 
            FLOOR(RANDOM() * 3 + 1)::INT
        -- Spor, Oyuncak, Ofis: 1-2 arası
        ELSE 
            FLOOR(RANDOM() * 2 + 1)::INT
    END as quantity,
    
    -- Ürünün satış fiyatı
    su.sale_price as unit_price,
    
    -- Mantıklı indirim (0-20% arası, çoğunlukla 0-10%)
    CASE 
        WHEN RANDOM() < 0.3 THEN 0                -- %30 indirimsiz
        WHEN RANDOM() < 0.6 THEN 5                -- %30 %5 indirim
        WHEN RANDOM() < 0.8 THEN 10               -- %20 %10 indirim
        WHEN RANDOM() < 0.95 THEN 15              -- %15 %15 indirim
        ELSE 20                                   -- %5 %20 indirim
    END as discount
    
FROM sipariş_ürünleri su
WHERE su.sıra <= (SELECT ürün_sayısı FROM sipariş_ürün_sayısı WHERE order_id = su.order_id);

-- Kontrol sorguları
-- 1. Toplam sipariş detayı sayısı
SELECT 'Toplam sipariş detayı sayısı' as istatistik, COUNT(*) as değer FROM order_items
UNION ALL
SELECT 'Toplam sipariş sayısı', COUNT(DISTINCT order_id) FROM order_items
UNION ALL
SELECT 'Her sipariş için ürün olmayan sipariş sayısı', 
       (SELECT COUNT(*) FROM orders WHERE order_id NOT IN (SELECT DISTINCT order_id FROM order_items));

-- 2. Sipariş başına ürün sayısı dağılımı
SELECT 
    product_count,
    COUNT(*) as sipariş_sayısı,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(DISTINCT order_id) FROM order_items), 2) as yüzde
FROM (
    SELECT 
        order_id, 
        COUNT(*) as product_count
    FROM order_items
    GROUP BY order_id
) t
GROUP BY product_count
ORDER BY product_count;

-- 3. Kategorilere göre dağılım
SELECT 
    c.category_name as kategori,
    COUNT(*) as satış_kalem_sayısı,
    SUM(oi.quantity) as toplam_adet,
    ROUND(AVG(oi.quantity), 2) as ortalama_miktar,
    MIN(oi.quantity) as min_miktar,
    MAX(oi.quantity) as max_miktar
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
JOIN categories c ON p.category_id = c.category_id
GROUP BY c.category_name
ORDER BY satış_kalem_sayısı DESC;

-- 4. İndirim dağılımı
SELECT 
    CASE 
        WHEN discount = 0 THEN 'İndirimsiz'
        WHEN discount <= 5 THEN '0-5% İndirim'
        WHEN discount <= 10 THEN '6-10% İndirim'
        WHEN discount <= 15 THEN '11-15% İndirim'
        WHEN discount <= 20 THEN '16-20% İndirim'
        ELSE '20%+ İndirim'
    END as indirim_aralığı,
    COUNT(*) as adet,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM order_items), 2) as yüzde
FROM order_items
GROUP BY 
    CASE 
        WHEN discount = 0 THEN 'İndirimsiz'
        WHEN discount <= 5 THEN '0-5% İndirim'
        WHEN discount <= 10 THEN '6-10% İndirim'
        WHEN discount <= 15 THEN '11-15% İndirim'
        WHEN discount <= 20 THEN '16-20% İndirim'
        ELSE '20%+ İndirim'
    END
ORDER BY adet DESC;

-- 5. Bazı örnek siparişleri göster
SELECT 
    o.order_id,
    o.order_date,
    c.first_name || ' ' || c.last_name as customer_name,
    o.order_status,
    COUNT(oi.product_id) as ürün_sayısı,
    STRING_AGG(p.product_name || ' (x' || oi.quantity::text || ')', ', ') as ürünler
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id
WHERE o.order_id IN (1, 2, 3, 50, 100, 200, 300, 400)
GROUP BY o.order_id, o.order_date, c.first_name, c.last_name, o.order_status
ORDER BY o.order_id;