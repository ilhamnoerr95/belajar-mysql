#CONSTRAIN UNTUK DATA DITABLE TETAP BAIK, bergunaka untuk terjadinya validasi yg salah di dalam program kita,
#sehingga data yg masuk database tetap terjaga

#UNIQUE CONSTRAIN 
#MEMASIKAN DATA HARUS UNIQUE / ga bisa nerima value yg duplikat

CREATE TABLE customers
( 
	id INT NOT NULL AUTO_INCREMENT,
    email VARCHAR(100) NOT NULL,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    PRIMARY KEY(id),
    UNIQUE KEY email_unique (email)
) ENGINE = InnoDB;

DESC produk;

#MENAMBHA / MENGHAPUS CONSTRAIN
ALTER TABLE customers 
DROP CONSTRAINT email_unique;
ALTER TABLE customers 
ADD CONSTRAINT email_unique UNIQUE (email);

INSERT INTO customers(email, first_name,last_name)
VALUES ('biji@gmail.com','biji', 'biji');

#CHECK CONSTRAINt
#KONDISI UNTUK CHECK DATA SEBELUM DI INSERT 
# KARENA TABLE SUDHA DIBUAT JADI TAMBAHKAN CONTRAIN CHECK DL
ALTER TABLE produk 
	ADD CONSTRAINT cek_price CHECK (price >= 10000);

#FULL-TEXT SEARCH UNTUK MENCARI DATA BER TIPE STRING
#apabila ingin membuat search engine tidak disarankn untuk menggunakan fulltext search ini,karena saat mysql mencari data mysql mencari data 
#yg paling awal
#karena tablenya sudha ada kita hanya tambah saja menggunakan command idbawah ini:
ALTER TABLE produk
	ADD FULLTEXT produk_fulltext (product);

#search natural languange mode
SELECT * FROM produk
WHERE MATCH (product) #nama kolomnya
	AGAINST ('biji' IN NATURAL LANGUAGE MODE); #value dengan modenya