#AUTO INCREMENT: membuat/insert data secara berututan ini hanya untuk primary KEY
#KALO SUDHA ADA AUTO INCREMENT TIDAK PERLU LAGI INSERT VALUE DENGAN MENAMBAHKAN ID 
#Aut increment akan ditambah secara berurutan apabila sudah dihapus aut incremen akan generate hasil last idnya
CREATE TABLE admin (
id INT NOT NULL AUTO_INCREMENT,
first_name VARCHAR(100) NOT NULL,
last_name VARCHAR(100) NOT NULL,
PRIMARY KEY (id)
)ENGINE = InnoDB;

DESCRIBE admin;

INSERT INTO admin (first_name,last_name) 
VALUES ('ilham','noer'),
		('adit','dwi');

SELECT * FROM admin ORDER BY id;	

#untuk mengetahui last id yg sudah diauto increment
SELECT LAST_INSERT_ID(); 

#fungsi date 
#MENAMBAHKAN KOLOM TIMESTAMP
SELECT id, YEAR(created_at) AS tahun,
			MONTH(created_at) AS bulan
FROM produk;

#flow control function sama seperti IF ELSE
#MENGGUNAKAN FLOW CASE 
SELECT *, 
	CASE category
		WHEN 'makanan' THEN 'UENAK'
        WHEN 'minuman' THEN 'SEGER'
        ELSE 'opo iki?'
        END AS 'Category'
FROM produk;

#MENGGUNAKAN FLOW IF
SELECT id, price ,
	IF(price < 20000, 'MURAH', 
		IF(price > 20000, 'MAHAL', 'MAHAL BANGET')
        )AS 'Mahal?'
FROM produk;

#IFNULL APABILA KOSONG
SELECT id, product, IFNULL (category, 'kosong') FROM produk;

SELECT * FROM produk;

#AGREGAT OPERASI DALAM AGREGASI DATA
#perlu di ingat agregat tidak bisa di gabungkan dengan select kolom biasa, harus menggunakan GROUP BY
SELECT COUNT(id) AS 'Total Id' FROM produk;

SELECT AVG(price) AS 'Rata2 Harga', category FROM produk GROUP BY category;

#GROUP BY clause
#Untuk melihat rata2 value menggunakan aggergate function berdasar per category
SELECT COUNT(id) AS 'Total Id',category AS 'group by kateogir' FROM produk GROUP BY category ;

#HAVING CLAUSE 
#FILTERING BERDASARKAN DATA YG SUDAH DI AGGREGRAT FUNCTION
SELECT COUNT(id) AS total, category 
	FROM produk GROUP BY category 
    HAVING total = 1;
    
SELECT MAX(price) AS max, category 
	FROM produk GROUP BY category 
    HAVING max > 15000;