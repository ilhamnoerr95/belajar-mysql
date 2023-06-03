#ONE TO ONE RELATIONSHIP : RELASI YG PALING SEDERHANA, TIAP DATA sebuah tabel HANYA BERELASI MAKSIMAL 1 DATA DI TABEL LAINNYA
#cara membuat one to one relationship: dengan membuat FOREIGN KEY DAN SET KOLOM TERSBUT MENGGUNAKAN UNIQUE KEY agar mencegah terjadinya duplikasi
# atau cara lain membuat tabel dengan primary key yg sama, sehingga ga perlu butuh lagi kolom untuk foreign key

CREATE TABLE wallet 
(
id INT NOT NULL AUTO_INCREMENT,
id_customer INT NOT NULL, 
balance INT NOT NULL DEFAULT 0,
PRIMARY KEY (id),
UNIQUE KEY id_customer_unique (id_customer),
	FOREIGN KEY (id_customer) REFERENCES customers (id)
) ENGINE = InnoDB;

SHOW CREATE TABLE wallet;
DESCRIBE wallet;

SELECT * FROM customers;

INSERT INTO wallet(id_customer) VALUES (1), (3);
SELECT * FROM wallet;

SELECT c.email, w.balance 
FROM wallet AS w 
JOIN customers AS c ON  (c.id = w.id_customer);

#------------------------------------------------------------------------------
#ONE TO MANY REALTIONSHIP: dimana 1 data table bisa digunakan lebih dari kali di tabel relasi
#ONE TO MANY GAK ADA BATASAN BERAPA BANYAK DI GUNAKAN, contoh tabel kategori dan produk dimana kategori bisa digunakan oleh lebih dari 1 produk
#artinya one kategori to many produk
#jadi si table produk gak perlu lagi pake unique key 
CREATE TABLE categories 
     (
     id VARCHAR(100) NOT NULl,
    name VARCHAR(100) NOT NULL,
     PRIMARY KEY (id)) ENGINE =InnoDB;
     
DESCRIBE categories;
show tables;

SELECT p.product, p.category, p.price, p.id_category, c.id AS kolom_categories_id , c.name 
FROM produk AS p 
JOIN categories AS c ON (c.id = p.id_category); 

#---------------------------------------------------------------------------------
#MANY TO MANY: agak kompleks , relasi dimana antara 2 tabel, dimana tabel pertama bisa punya banyak relasi di tabel kedua dan tabel kedua punya relasi banyak di tabel pertama.
#relasi kebnayakan secara bolak balik,
# solusi dari many to many menambhkan 1 table relasi ditengah2 tabel keduanya
#MANY TO MANY GABUNGAN ANTARA ONE TO MANY
CREATE TABLE orders (
ID INT NOT NULL AUTO_INCREMENT,
total INT NOT NULL ,
order_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
PRIMARY KEY (id)
)ENGINE = InnoDB;

DESCRIBE orders_detail;
SELECT * FROM produk;
SHOW CREATE TABLE produk;

CREATE TABLE orders_detail (
id_products INT NOT NULL,
id_order INT NOT NULL,
price INT NOT NULL,
quantity INT NOT NULL,
PRIMARY KEY (id_products, id_order))
ENGINE = InnoDB;

ALTER TABLE orders_detail
	ADD CONSTRAINT fk_orders_detail_product 
		FOREIGN KEY(id_products) REFERENCES produk(id);
        
ALTER TABLE orders_detail
	ADD CONSTRAINT fk_orders_detail_orders 
		FOREIGN KEY (id_order) REFERENCES orders(id);
        
SELECT * FROM orders;
SELECT * FROM produk;
SELECT * FROM orders_detail;

INSERT INTO orders (total) VALUES(10000), (500000);
INSERT INTO orders_detail (id_products,id_order,price,quantity) VALUES (5,1, 25000,1), (2,1, 25000,1);
INSERT INTO orders_detail (id_products,id_order,price,quantity) VALUES (5,1, 15000,5), (2,2, 35000,10);