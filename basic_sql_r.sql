#TABLE RELATIONSHIP
#RELASI TABLE 1 DNG TABLE LAINNYA
#Saat membuat relasi kita membuat kolom sebagai referens ke tabel lainnya.
#Kolom referensi biasanya dipanggil FOREIGN KEY, FOREIGN KEY bisa lebih dari 1 
SHOW TABLES;

CREATE TABLE wishlist
(
	id INT NOT NULL AUTO_INCREMENT,
    id_product INT NOT NULL,
    description TEXT,
    PRIMARY KEY (id),
    CONSTRAINT wishlist_product
		FOREIGN KEY (id_product) REFERENCES produk (id) #ngerefernsikan foreign key id_produk ke dalam produk id
) ENGINE = InnoDB;

DESC wishlist;
SHOW CREATE TABLE wishlist;

#menghapus foreign key:
#dengan alter table drop constraint nama_constraint
ALTER TABLE wishlist
	DROP CONSTRAINT wishlist_product;
    
#untuk menambhakan foreign key:
ALTER TABLE wishlist
	ADD CONSTRAINT biji
		FOREIGN KEY (id) REFERENCES products(id);
        
#APABILA KITA INGIN MENAMBHAK DATA KEDALAM DATA YG ID FOREIGNYA TIDAK ADA DITABLE SBLAH MAKA MYSQL AKAN MENOLAK 
#DAN APABILA DISAAT ID TABLE A INGIN MENGHAPUS YG DIMANA SI DATA TABLE A MEMILKI MEMILIKI REFERENSI FOREIGN KEY DI TABLE LAIN MAKA 
#DATA TERSEBUT TIDAK BISA DI DELETE
INSERT INTO wishlist (id_product, description)
	VALUE (7, "makanan apa ini");
DELETE FROM produk
	WHERE id = 1;
    
#BEHAVIOR FOREIGN KEY
# RESTRICT ,ON DELETE = ditolak, ON update = ditolak
# CASECADE, ON DELETE= DATA AKAN DIHAPUS, ON UDPATE= DATA KAN IKUT DIUBAH ,NOTE: APABILA DATA TABLE DI B(PARENT/REFERENSI) DI HAPUS LALU ADA DATA TABLE A DIMANA MEMILIKI RELASI DENGAN DATA B OTOMATIS DATA A JUGA IKUT TERHAPUS
# NO ACTION, ON DELETE= DATA DIBIARKAN, ON UPDATE = DATA DIBIARKAN , JADI DATA DIBIARIN KALO SUDAH DIHAPUS
# SET NULL, ON DELETE = DIUBAH JADI NULL, ON UPDATE = DIUBAH JADI NULL , NOTE: KOLOM HARUS NULL KALO MEMANG MAU DI SET NULL
# DEFAULT SELALU RESTRICT
ALTER TABLE wishlist
	ADD CONSTRAINT wishlist_product
		FOREIGN KEY (id_product) REFERENCES produk(id)
			ON DELETE CASCADE ON UPDATE CASCADE;
            
#JOIN TABLE: MENGGABUNGKAN TABLE 1 DENGAN TABLE LAIN DAN COCOK DENGAN FOREIGN KEY
#NOTE SEMAKIN BANYAK JOIN PROSES QUERY AKAN SEMAKIN BERAT DAN LAMBAT, IDEAL JOIN JANGAN LEBIH DARI 5 TABEL

#join semua kolom 
SELECT * FROM wishlist
JOIN produk ON (wishlist.id_product = produk.id); # ini penghubung join table, join kolom

#join beberapa nama kolom saja
SELECT c.email as email,w.id as id_wishlist, w.id_product as id_product_ws, p.id as id_product,c.id as customer_id, w.id_customer, w.description
FROM wishlist AS w
JOIN produk AS p ON (w.id_product = p.id)
JOIN customers AS c ON (w.id_customer = c.id);

