-- SQL ifadelerinizi buraya yazınız.

BEGIN;


CREATE TABLE IF NOT EXISTS public.ogrenci
(
    id smallint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 ),
    ad character varying(20) NOT NULL,
    soyad character varying(30) NOT NULL,
    dtarih date NOT NULL,
    cinsiyet character varying NOT NULL,
    sinif character varying NOT NULL,
    puan numeric NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.islem
(
    id smallint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 ),
    ogrenci_id smallint NOT NULL,
    kitap_id smallint NOT NULL,
    atarih date NOT NULL,
    vtarih date NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.kitap
(
    id smallint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 ),
    ad character varying NOT NULL,
    sayfasayisi integer NOT NULL,
    puan numeric NOT NULL,
    yazar_id smallint NOT NULL,
    tur_id smallint NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.yazar
(
    id smallint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 ),
    ad character varying(20) NOT NULL,
    soyad character varying(30) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.tur
(
    id smallint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 ),
    ad character varying NOT NULL,
    PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS public.islem
    ADD FOREIGN KEY (ogrenci_id)
    REFERENCES public.ogrenci (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.islem
    ADD FOREIGN KEY (kitap_id)
    REFERENCES public.kitap (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.kitap
    ADD FOREIGN KEY (yazar_id)
    REFERENCES public.yazar (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.kitap
    ADD FOREIGN KEY (tur_id)
    REFERENCES public.tur (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

END;

--SORU 4
--1
ALTER TABLE ogrenci
ADD COLUMN sehir character varying(30) NOT NULL

--2
ALTER TABLE ogrenci ALTER COLUMN dtarih TYPE date;
ALTER TABLE islem ALTER COLUMN atarih TYPE date;
ALTER TABLE islem ALTER COLUMN vtarih TYPE date;

--3
ALTER TABLE ogrenci
ADD COLUMN dogum_yeri character varying(30) NOT NULL DEFAULT 'Türkiye'

--4
ALTER TABLE ogrenci
DROP COLUMN puan

--5
CREATE TABLE kiz_ogrenciler AS 
(SELECT * FROM ogrenci WHERE cinsiyet = 'K')

--6
DROP TABLE kiz_ogrenciler

--7
CREATE TABLE kiz_yurdu
(	id smallint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 ),
	ad character varying(50) NOT NULL,
	PRIMARY KEY (id)
)

INSERT INTO kiz_yurdu(ad) VALUES('Boğaziçi')

CREATE TABLE kiz_yurdunda_kalanlar AS
(SELECT * FROM ogrenci WHERE cinsiyet ='K')

--8
ALTER TABLE kiz_ogrenciler RENAME TO kogrenciler

--9
ALTER TABLE yazar
RENAME COLUMN ad TO name

--10
ALTER TABLE yazar
ADD COLUMN ulke character varying(30) NOT NULL DEFAULT 'Türkiye', 
ADD COLUMN universite character varying(50) NOT NULL

--11
one-to-one:

vatandaş-kimlik
kişi-parmak izi 
ülke-başkent
telefon-imei numarası
araba-şase numarası
element-formül

one-to-many:

ülke-şehir
anne-çocuk
sporcu-takım
çalışan-departman
kitap-yazar


many-to-many:
öğretmen-öğrenci
öğrenci-ders
çalışan-proje
film-kategori
hasta-doktor





