#JENIS2 JOIN:
#INNER JOIN, LEFT JOIN, RIGHT JOIN, RIGHT JOIN, CROSS JOIN

#INNER JOIN: DEFAULT JOIN MYSQL/ sama aja kaya JOIN biasa,
#Diman terdapat antara relasi table 1 dan 2 , jd jika tabel 1 ga punya relasi dengan table 2 maka hasil inner join gak tampil.
#apabila yg tidak memilki relasi datanya tidak akan tampil.
SELECT * FROM categories;
SELECT * FROM products;

SELECT * FROM categories 
	INNER JOIN products ON (categories.id = products.id_category);

#LEFT JOIN: MEkanisme sama seperti INNER JOIN akan tetapi data table pertama akan diambil juga, maksutnya apbila ada data yg 
#tidak memilki relasi di table kedua hasilnya akan NULL

SELECT * FROM categories 
	LEFT JOIN products ON (categories.id = products.id_category);

#RIGHT JOIN: Kebalikan dari mekanisme dari LEFT Join, jadi yg terlihat data table kedua
SELECT * FROM categories 
	RIGHT JOIN products ON (categories.id = products.id_category);
    
#CROSS JOIN: SANGAT JARANG SEKALI DIGUNAKAN,
    
