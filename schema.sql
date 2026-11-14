-- Jalankan di Supabase SQL Editor.
create table if not exists public.site_config (
  id integer primary key check (id = 1),
  config jsonb not null default '{}'::jsonb,
  updated_at timestamptz not null default now()
);
alter table public.site_config enable row level security;

-- Pengunjung dapat membaca konfigurasi toko.
drop policy if exists "Public can read site config" on public.site_config;
create policy "Public can read site config"
on public.site_config for select
to anon, authenticated
using (true);

-- Hanya akun dengan email admin yang ditentukan yang boleh mengubah konfigurasi.
-- Ganti admin@emailkamu.com dengan email akun admin Supabase.
drop policy if exists "Only store admin can write config" on public.site_config;
create policy "Only store admin can write config"
on public.site_config for all
to authenticated
using ((auth.jwt() ->> 'email') = 'admin@emailkamu.com')
with check ((auth.jwt() ->> 'email') = 'admin@emailkamu.com');

insert into public.site_config (id, config)
values (1, '{
  "name":"ASTRA",
  "logo":"A",
  "desc":"Temukan aplikasi favoritmu di satu tempat.",
  "discount":"DISKON 88%",
  "color":"#0879e8",
  "footer":"Dibuat dengan ♥ • Loot Block",
  "wa":"6281234567890",
  "channel":"https://whatsapp.com/",
  "group":"https://whatsapp.com/",
  "tiktok":"https://tiktok.com/",
  "tiktokName":"@akun-toko",
  "apps":[{"name":"Contoh Aplikasi","code":"JB-0001","category":"Common","price":"3RB","desc":"Deskripsi singkat aplikasi","image":""}],
  "prices":[{"name":"PAKET PERMANEN ALL TEMA","price":"RP 15.000","features":["Unlock all tema","Unlock all website","Unlock all poster"]},{"name":"PAKET TERBATAS","price":"RP 5.000","features":["Full akses website"]}],
  "testimonials":["Transaksi sukses ✓","Terima kasih, order selesai ✓","Pelayanan cepat ✓"]
}'::jsonb)
on conflict (id) do nothing;
