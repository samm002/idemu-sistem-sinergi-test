-- PostgreSQL --

-- Persiapan

-- 1. Create Database
CREATE DATABASE idemu_sistem_energi;

-- 2. Create Mahasiswa table
CREATE TABLE mahasiswa(
  nim INTEGER PRIMARY KEY,
  nama VARCHAR(255),
  alamat TEXT,
  jurusan VARCHAR(100),
  umur SMALLINT
);

-- 3. Create Mata Kuliah table
CREATE TABLE mata_kuliah(
  id SERIAL PRIMARY KEY,
  mata_kuliah VARCHAR(255),
  nim INTEGER,
  nilai SMALLINT,
  dosen_pengajar VARCHAR(255),
  CONSTRAINT fk_mahasiswa FOREIGN KEY(nim) REFERENCES mahasiswa(nim)
);

-- 4. Insert data in Mahasiswa table
INSERT INTO mahasiswa (nim, nama, alamat, jurusan, umur)
VALUES
    (123456, 'John', 'Jl. Merdeka No. 1', 'Teknik Informatika', 21),
    (234567, 'Alice', 'Jl. Gatot Subroto', 'Sistem Infomasi', 23),
    (345678, 'Bob', 'Jl. Sudirman No. 5', 'Teknik Informatika', 20),
    (456789, 'Cindy', 'Jl. Pahlawan No. 2', 'Manajemen', 22),
    (567890, 'David', 'Jl. Diponegoro No. 3', 'Teknik Elektro', 25),
    (678901, 'Emily', 'Jl. Cendrawasih No. 4', 'Manajemen', 24),
    (789012, 'Frank', 'Jl. Ahmad Yani No. 6', 'Teknik Informatika', 19);

-- 5. Insert data in Mata Kuliah table
INSERT INTO mata_kuliah (mata_kuliah, nim, nilai, dosen_pengajar)
VALUES
    ('Pemrograman Web', 123456, 85, 'Pak Budi'),
    ('Basis Data', 234567, 70, 'Ibu Ani'),
    ('Jaringan Komputer', 345678, 75, 'Pak Dodi'),
    ('Sistem Operasi', 123456, 90, 'Pak Budi'),
    ('Manajemen Proyek', 456789, 80, 'Ibu Desi'),
    ('Bahasa Inggris', 567890, 85, 'Ibu Eka'),
    ('Statistika', 678901, 75, 'Pak Farhan'),
    ('Algoritma', 789012, 65, 'Pak Galih'),
    ('Pemrograman Java', 123456, 95, 'Pak Budi');

-- Jawaban

-- 1. Update alamat mahasiswa dengan NIM ‘123456’ menjadi ‘Jl. Raya No.5
UPDATE mahasiswa
SET alamat = 'Jl. Raya No.5'
WHERE nim = 123456;

-- 2. Tampilkan NIM, nama, dan jurusan dari mahasiswa yang memiliki jurusan ‘Teknik Informatika’, serta tampilkan juga nama dosen pembimbingnya
SELECT mahasiswa.nim AS NIM, mahasiswa.nama AS Nama, mahasiswa.jurusan AS Jurusan, mata_kuliah.dosen_pengajar AS "Dosen Pengajar"
FROM mahasiswa
LEFT JOIN mata_kuliah ON mata_kuliah.nim = mahasiswa.nim
WHERE mahasiswa.jurusan = 'Teknik Informatika'
GROUP BY mahasiswa.nim, mahasiswa.nama, mahasiswa.jurusan, mata_kuliah.dosen_pengajar;

-- 3. Tampilkan 5 nama mahasiswa dengan umur tertua
SELECT *
FROM mahasiswa
ORDER BY umur DESC
LIMIT 5;

-- 4. Tampilkan nama mahasiswa, mata kuliah yang diambil, dan nilai yang diperoleh untuk setiap mata kuliah. Hanya tampilkan data mahasiswa yang memiliki nilai lebih bagus dari 70
SELECT mahasiswa.nama AS Nama, mata_kuliah.mata_kuliah AS "Mata Kuliah", mata_kuliah.nilai AS nilai
FROM mahasiswa
LEFT JOIN mata_kuliah ON mata_kuliah.nim = mahasiswa.nim
WHERE mata_kuliah.nilai > 70;