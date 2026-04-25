# Pertemuan 4 - Struktur Kontrol Percabangan

**Nama:** Muh. Ardiansyah  
**NIM:** IK2411019  
**Kelas:** Reguler  
**Mata Kuliah:** Pemrograman Basis Data  
**Dosen:** Abdul Malik, S.Kom., M.Cs. 

---

## Ringkasan Tugas

Tugas pertemuan ke-4 ini membahas penggunaan struktur kontrol percabangan di MySQL, yaitu `IF-THEN-ELSEIF` dan `CASE`. Ada tiga latihan dan satu kuis coding yang dikerjakan:

- **Latihan 1** — Procedure `cek_status_stok`: menentukan status stok (Habis / Hampir Habis / Tersedia / Stok Aman) berdasarkan jumlah stok yang diberikan.
- **Latihan 2** — Tabel `produk` + query `SELECT` dengan `CASE Expression` untuk menampilkan status stok setiap produk tanpa procedure.
- **Latihan 3** — Procedure `hitung_diskon`: menghitung diskon, potongan, dan total bayar berdasarkan total belanja pelanggan.
- **Kuis Coding** — Procedure `cek_predikat_mahasiswa`: menentukan predikat dan status kelulusan berdasarkan nilai mahasiswa.

---

## Cara Menjalankan Script SQL

1. Pastikan XAMPP sudah aktif dan MySQL sudah berjalan.
2. Buka **phpMyAdmin** di browser (`http://localhost/phpmyadmin`) atau gunakan **MySQL Shell**.
3. Buka tab **SQL** kemudian copy-paste isi file `kuis_pertemuan4_IK2411019.sql`, atau gunakan fitur **Import** untuk mengimpor file SQL langsung.
4. Klik **Go / Execute** untuk menjalankan semua script sekaligus.
5. Script akan otomatis membuat database `db_pertemuan4`, membuat semua tabel, mengisi data, membuat procedure, dan menjalankan pengujian.

> **Catatan:** Jika procedure sudah pernah dibuat sebelumnya, script sudah menyertakan `DROP PROCEDURE IF EXISTS` di bagian atas setiap procedure, jadi tidak perlu menghapus manual.

---

## Daftar File di Repository

```
pbasisdata-pertemuan4-muh-ardiansyah-IK2411019/
├── README.md
├── kode_sql/
│   └── pertemuan4_IK2411019.sql
└── laporan/
    └── laporan_analisis_pertemuan4_IK2411019.pdf
```

### Penjelasan File

| File | Keterangan |
|------|------------|
| `kuis_pertemuan4_IK2411019.sql` | Script SQL lengkap: pembuatan database, tabel, data contoh, semua procedure, query CASE, dan script pengujian |
| `laporan_analisis_pertemuan4_IK2411019.pdf` | Laporan analisis berisi identitas, deskripsi kasus, penjelasan logika percabangan, langkah pengerjaan, hasil eksekusi, analisis output, dan kesimpulan |