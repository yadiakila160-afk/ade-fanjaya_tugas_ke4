-- Kuis dan Latihan Pertemuan 4 - Struktur Kontrol Percabangan
-- Nama  : Muh. Ardiansyah
-- NIM   : IK2411019
-- Kelas : Reguler
-- Mata Kuliah : Pemrograman Basis Data
-- Dosen : Abdul Malik, S.Kom., M.Cs.


-- PERSIAPAN DATABASE
CREATE DATABASE IF NOT EXISTS db_pertemuan4;
USE db_pertemuan4;

-- PEMBUATAN TABEL MAHASISWA
DROP TABLE IF EXISTS mahasiswa;

CREATE TABLE mahasiswa (
    nim         VARCHAR(15)  PRIMARY KEY,
    nama        VARCHAR(100),
    nilai_akhir DECIMAL(5,2)
);

INSERT INTO mahasiswa (nim, nama, nilai_akhir) VALUES
('240001', 'Andi',  88),
('240002', 'Budi',  76),
('240003', 'Citra', 68),
('240004', 'Dewi',  55),
('240005', 'Eka',   40);

-- LATIHAN 1 - Procedure cek_status_stok
DROP PROCEDURE IF EXISTS cek_status_stok;

DELIMITER $$

CREATE PROCEDURE cek_status_stok(IN p_stok INT)
BEGIN
    DECLARE v_status VARCHAR(50);

    IF p_stok = 0 THEN
        SET v_status = 'Habis';
    ELSEIF p_stok <= 5 THEN
        SET v_status = 'Hampir Habis';
    ELSEIF p_stok <= 20 THEN
        SET v_status = 'Tersedia';
    ELSE
        SET v_status = 'Stok Aman';
    END IF;

    SELECT
        p_stok   AS jumlah_stok,
        v_status AS status_stok;
END $$

DELIMITER ;

-- Pengujian Latihan 1
CALL cek_status_stok(0);    -- Habis
CALL cek_status_stok(3);    -- Hampir Habis
CALL cek_status_stok(15);   -- Tersedia
CALL cek_status_stok(25);   -- Stok Aman



-- LATIHAN 2 - Tabel Produk + CASE dalam SELECT
DROP TABLE IF EXISTS produk;

CREATE TABLE produk (
    id_produk   INT AUTO_INCREMENT PRIMARY KEY,
    nama_produk VARCHAR(100),
    stok        INT
);

INSERT INTO produk (nama_produk, stok) VALUES
('Laptop Asus',          2),
('Mouse Logitech',      15),
('Keyboard Mechanical', 30),
('Monitor LG',           0),
('Headset Sony',         8);

-- Query menampilkan status stok menggunakan CASE Expression
SELECT
    id_produk,
    nama_produk,
    stok,
    CASE
        WHEN stok = 0   THEN 'Habis'
        WHEN stok <= 5  THEN 'Hampir Habis'
        WHEN stok <= 20 THEN 'Tersedia'
        ELSE                 'Stok Aman'
    END AS status_stok
FROM produk;



-- LATIHAN 3 - Procedure hitung_diskon
DROP PROCEDURE IF EXISTS hitung_diskon;

DELIMITER $$

CREATE PROCEDURE hitung_diskon(IN p_total DECIMAL(12,2))
BEGIN
    DECLARE v_persen   INT;
    DECLARE v_potongan DECIMAL(12,2);
    DECLARE v_bayar    DECIMAL(12,2);

    IF p_total >= 1000000 THEN
        SET v_persen = 15;
    ELSEIF p_total >= 500000 THEN
        SET v_persen = 10;
    ELSEIF p_total >= 250000 THEN
        SET v_persen = 5;
    ELSE
        SET v_persen = 0;
    END IF;

    SET v_potongan = p_total * v_persen / 100;
    SET v_bayar    = p_total - v_potongan;

    SELECT
        p_total    AS total_belanja,
        v_persen   AS diskon_persen,
        v_potongan AS jumlah_diskon,
        v_bayar    AS total_bayar;
END $$

DELIMITER ;

-- Pengujian Latihan 3
CALL hitung_diskon(1200000);   -- diskon 15%
CALL hitung_diskon(750000);    -- diskon 10%
CALL hitung_diskon(300000);    -- diskon 5%
CALL hitung_diskon(150000);    -- tidak ada diskon



-- KUIS CODING - Procedure cek_predikat_mahasiswa
DROP PROCEDURE IF EXISTS cek_predikat_mahasiswa;

DELIMITER $$

CREATE PROCEDURE cek_predikat_mahasiswa(IN p_nilai DECIMAL(5,2))
BEGIN
    DECLARE v_predikat VARCHAR(50);
    DECLARE v_status   VARCHAR(20);

    -- blok 1: menentukan predikat
    IF p_nilai >= 90 THEN
        SET v_predikat = 'Sangat Memuaskan';
    ELSEIF p_nilai >= 80 THEN
        SET v_predikat = 'Memuaskan';
    ELSEIF p_nilai >= 70 THEN
        SET v_predikat = 'Baik';
    ELSEIF p_nilai >= 60 THEN
        SET v_predikat = 'Cukup';
    ELSE
        SET v_predikat = 'Kurang';
    END IF;

    -- blok 2: menentukan status kelulusan
    IF p_nilai >= 70 THEN
        SET v_status = 'Lulus';
    ELSE
        SET v_status = 'Tidak Lulus';
    END IF;

    SELECT
        p_nilai    AS nilai,
        v_predikat AS predikat,
        v_status   AS status_kelulusan;
END $$

DELIMITER ;

-- Pengujian Kuis
CALL cek_predikat_mahasiswa(95);   -- Sangat Memuaskan | Lulus
CALL cek_predikat_mahasiswa(85);   -- Memuaskan        | Lulus
CALL cek_predikat_mahasiswa(75);   -- Baik             | Lulus
CALL cek_predikat_mahasiswa(65);   -- Cukup            | Tidak Lulus
CALL cek_predikat_mahasiswa(50);   -- Kurang           | Tidak Lulus