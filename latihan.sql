-- Latihan 1 --

-- Membuat tabel Employee --
CREATE TABLE Employee (
    id_emp VARCHAR(5),
    name_emp VARCHAR(50),
    age INT
);

-- Menampilkan tabel yang telah dibuat --
SELECT * FROM Employee;

-- Menambahkan data --
INSERT INTO Employee VALUES ('123', 'Budi', 21);
INSERT INTO Employee VALUES ('234', 'Dani', 23);

-- Latihan 2 --

-- Menampilkan data yang telah di-INSERT --
SELECT * FROM Employee;

-- Mengubah data baris kedua --
UPDATE Employee
SET name_emp = 'Dani', age = 23
WHERE id_emp = '234';

-- Latihan 3 --

-- Menjadikan id_emp sebagai Primary Key --
ALTER TABLE Employee
ADD PRIMARY KEY (id_emp);

-- Menampilkan struktur tabel Employee --
-- Menggunakan sp_columns sebagai pengganti DESCRIBE untuk SQL Server 
EXEC sp_columns Employee;

-- Menambahkan data
INSERT INTO Employee (id_emp, name_emp, age) VALUES ('123', 'Arief', 24);

-- Latihan 4 --

-- Menghapus data dengan kondisi WHERE --
DELETE FROM Employee WHERE id_emp = '123'; --> Menghapus berdasarkan id_emp
DELETE FROM Employee WHERE name_emp = 'Intan'; --> Menghapus berdasarkan nama
DELETE FROM Employee WHERE age = 21; --> Menghapus berdasarkan umur

-- Latihan 5 --

-- Menambahkan data --
INSERT INTO Employee (id_emp, name_emp, age) VALUES ('211', 'Mulya', 21);
INSERT INTO Employee (id_emp, name_emp, age) VALUES ('212', 'Dewi', 22);
INSERT INTO Employee (id_emp, name_emp, age) VALUES ('213', 'Ayu', 23);

-- Menghapus semua data --
DELETE FROM Employee;

-- Membatalkan penghapusan data --
ROLLBACK;

-- Latihan 6 --

-- Menampilkan data dengan nama 'Budi' dan usia di atas 21 tahun --
SELECT * FROM Employee WHERE name_emp = 'Budi' AND age > 21;

-- Menampilkan data dengan usia antara 22 hingga 24 tahun --
SELECT * FROM Employee WHERE age BETWEEN 22 AND 24;

-- Latihan 7 --

-- Menambahkan kolom 'gol' --
ALTER TABLE Employee
ADD gol VARCHAR(5);

-- Mengisi kolom gol --
UPDATE Employee
SET gol = CASE
    WHEN id_emp = '123' THEN 'I'
    WHEN id_emp = '234' THEN 'II'
    WHEN id_emp = '134' THEN 'III'
    WHEN id_emp = '144' THEN 'II'
    WHEN id_emp = '155' THEN 'I'
END;

-- Menggunakan BETWEEN, IN, dan LIKE --
SELECT * FROM Employee WHERE age BETWEEN 22 AND 24; --> BETWEEN
SELECT * FROM Employee WHERE gol IN ('I', 'II'); --> IN
SELECT * FROM Employee WHERE name_emp LIKE 'Budi%'; --> LIKE

-- Latihan 8 --

-- Menggunakan SELECT untuk menambahkan data dari tabel lain --
INSERT INTO Employee (id_emp, name_emp, age)
SELECT id, name, age FROM OtherTable WHERE condition;

-- Latihan 9 --

-- Menambahkan data ke kolom tertentu --
INSERT INTO Employee (id_emp, name_emp) VALUES ('214', 'Siti');

-- Membatalkan operasi INSERT INTO
ROLLBACK;

-- Latihan 10 --

-- Membuat tabel golongan --
CREATE TABLE Golongan (
    gol VARCHAR(5),
    gol_name VARCHAR(50)
);

-- Mengisi data golongan --
INSERT INTO Golongan (gol, gol_name) VALUES ('I', 'Golongan I');
INSERT INTO Golongan (gol, gol_name) VALUES ('II', 'Golongan II');
INSERT INTO Golongan (gol, gol_name) VALUES ('III', 'Golongan III');

-- Menambahkan Foreign Key dari Employee ke Golongan --
ALTER TABLE Employee
ADD CONSTRAINT fk_golongan
FOREIGN KEY (gol) REFERENCES Golongan(gol);

-- Latihan 11 (terakhir) --

-- Menampilkan nama golongan untuk setiap Employee --
SELECT Employee.id_emp, Employee.name_emp, Employee.age, Golongan.gol_name
FROM Employee
JOIN Golongan ON Employee.gol = Golongan.gol;