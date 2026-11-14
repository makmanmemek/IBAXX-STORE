# Brand Store — Vercel + Supabase

Template toko aplikasi bergaya pixel-art, responsif untuk HP/desktop, dengan panel admin untuk mengganti brand dan konten tanpa mengubah kode.

## Fitur
- Beranda, katalog aplikasi, pencarian, filter kategori, favorit.
- Bagian komunitas, info toko, paket harga, testimoni.
- Panel admin login Supabase.
- Admin dapat mengubah nama brand, logo teks, deskripsi, promo, warna, footer, tautan WhatsApp/komunitas/TikTok, katalog, dan paket harga.
- Data toko disimpan di Supabase sehingga perubahan tampil bagi semua pengunjung.

## 1. Siapkan Supabase
1. Buat project di https://supabase.com/
2. Buka **SQL Editor**, jalankan seluruh isi `schema.sql`.
3. Buka **Authentication → Users**, tambahkan user admin dengan email dan password.
4. Pada `schema.sql`, ganti `admin@emailkamu.com` di policy dengan email admin yang sama, lalu jalankan ulang bagian policy (drop + create).
5. Buka **Project Settings → API**, salin Project URL dan anon/public key.

## 2. Hubungkan project
Edit `config.js`:
- `SUPABASE_URL`: Project URL Supabase.
- `SUPABASE_ANON_KEY`: anon/public key (aman digunakan di browser bersama RLS yang benar).
- `ADMIN_EMAIL`: email admin (untuk referensi tampilan; izin sebenarnya ditegakkan oleh policy database).

**Jangan pernah menaruh `service_role` key di `config.js` atau kode frontend.**

## 3. Deploy ke Vercel
1. Ekstrak ZIP ini.
2. Upload folder project ke GitHub.
3. Di https://vercel.com/ pilih **Add New → Project**, impor repository.
4. Framework preset pilih **Other**; Build Command dan Output Directory dikosongkan/default. Karena ini situs statis, `index.html` langsung dilayani.
5. Klik Deploy.

Alternatif: jalankan lokal dengan server statis, misalnya `npx serve .`.

## 4. Mengganti nama brand
Buka website → tekan tombol ⚙ → login dengan akun admin → tab **Brand** → ubah nama brand dan logo → **Simpan Perubahan**. Pengunjung akan melihat perubahan setelah halaman dimuat ulang.

## Format katalog di panel admin
Satu item per baris, format:
`Nama | Kode | Kategori | Harga | Deskripsi | URL gambar`

Contoh:
`JBKU | JB-0006 | Common | 3RB | Aplikasi katalog | https://contoh.com/gambar.jpg`

Kategori yang tersedia di filter: Common, Rare, Epic, Legend.

## Format paket harga
Satu paket per baris:
`Nama paket | Harga | Fitur 1, Fitur 2, Fitur 3`

## Catatan
- Ganti nomor WhatsApp, link komunitas, harga, dan konten contoh sebelum website dipublikasikan.
- Favorit disimpan di browser pengunjung masing-masing.
- Testimoni bawaan adalah teks contoh; ganti hanya dengan testimoni asli yang kamu punya izin untuk tampilkan.
- Tautan dan katalog dikelola admin. Pastikan file/aplikasi yang kamu tawarkan aman, legal, dan memiliki izin distribusi.
