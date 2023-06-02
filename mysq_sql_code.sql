#membuat database
CREATE DATABASE NAMA_DATABASE;
#SHOW DABASES;
SHOW DATABASES;

#create table colomn
CREATE TABLE barang (
    kode INT,
    nama VARCHAR(100) NOT NULL DEFAULT 'COBA',
    harga INT NOT NULL DEFAULT 0,
    jumlah INT
) ENGINE = InnoDB;

#melihat semua table
SHOW TABLES;
#melihat isi kolom table
DESCRIBE produk; 
#melihat hasil create sql table
show CREATE TABLE barang;

#untuk mengubah table produk dengan alter
ALTER TABLE produk
MODIFY harga INT UNSIGNED;
#rename colom
ALTER TABLE produk
RENAME COLUMN produk TO product;
#menambah kolom dan menambahkan not null maupun default dari valuenya
ALTER TABLE produk
ADD COLUMN quantity INT unsigned NOT NULL DEFAULT 0;
#nambah column dengan default current_timestamp guna untuk update data date 
ALTER TABLE barang
ADD COLUMN waktu_dibuat TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP;
#menghapus column
ALTER TABLE barang
	DROP COLUMN salah;
#membuat column enum
ALTER TABLE produk
ADD COLUMN category ENUM('makanan','minuman', 'lain-lain') AFTER product;
#PRIMARY KEY
ALTER TABLE produk
ADD PRIMARY KEY (Id);

#insert 1 value
INSERT INTO produk(id,product,price)
VALUES (1, 'biji',15000);

#Insert lebih dari 1 value kedalam table-- 
INSERT INTO produk(id,product,price)
VALUES (2, 'beras',25000),
		(3, 'betani',35000);
INSERT INTO produk(id,product,category,price)
VALUES (4, 'kacang','makanan',55000);

#menghapus data table 
DELETE FROM produk WHERE ID = 4;

#melihat semua data dari 1 table
SELECT * FROM produk;

#SELECT SPESIFIK KOLOM
SELECT id,product, price FROM produk;

#select  table deng argumen WHERE CLAUSE
SELECT * FROM produk
WHERE id = 2;
#where operator
SELECT * FROM produk
WHERE quantity > 100;
#WHERE AND
SELECT * FROM produk 
WHERE quantity >= 100 AND price > 15000;
#WHERE OR
SELECT * FROM produk
WHERE quantity > 100 OR price > 15000;
#SAAT INGIN PRIORITY DIDALAM WHERE MENGGUNAKAN () DAN APABILA TIDAK ADA () MAKA AND LEBIH PRIORITY DIBANDINGKAN OR
SELECT * FROM produk
WHERE (category = 'minuman' OR price > 15000)
	AND price > 15000 ;
#LIKE OPERATOR
SELECT * FROM produk
WHERE product LIKE '%s';
#NULL OPERATOR
SELECT * FROM produk
WHERE category IS NOT NULL;
#WHEREBETWEEN
SELECT * FROM produk
WHERE price BETWEEN 10000 AND  25000;
#WHERE IN & NOT IN => mencari bbrp nilai dari 1 kolom 
SELECT * FROM produk 
WHERE category NOT IN ('makanan');

#ORDER CLAUSE => perurutan data, DEFAUL URUTAN ASCT. ketika order by lebih dari 1 kolom maka membaca kolom pertama dlu dan selanjutnya
SELECT * FROM produk
ORDER BY category ASC, price DESC;

#Limit clause => limitiasi dalam mencari data
#limit clause ada 2 parameter, pertama untuk page/skip berapa data, yg kedua brp data yg mau di limit
SELECT * FROM produk
WHERE price < 100000
ORDER BY ID DESC 
LIMIT 2, 2;

#DISTICN MENCARI DATA YG DUPLIKATNYA SAMA DIJADIKAN 1 DATA
#apabila ingn mencari kolom lebih dari satu dan value dari colom tersebut tidak ada yg sama, maka DISTINCT tidak akan bekerja
SELECT DISTINCT category FROM produk;

#NUMERIC QUERY 
SELECT id, price * 2 AS 'Harga x 2' FROM produk;

#untuk update data  
UPDATE produk 
SET category = 'minuman',
	price = price + 55000
WHERE id = 3;

#ALIAS sql
#kolom
SELECT id AS 'kode',
		price AS 'harga'
FROM produk;

#alias untuk table
SELECT p.id AS 'kode',
		p.price AS 'harga'
FROM produk as p;

ALTER TABLE produk
MODIFY id INT AUTO_INCREMENT;

DESC produk;

