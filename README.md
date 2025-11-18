# football_shop

## Tugas 7
1. Jelaskan apa itu widget tree pada Flutter dan bagaimana hubungan parent-child (induk-anak) bekerja antar widget.
Widget tree pada Flutter adalah susunan atau struktur hierarki dari seluruh widget yang digunakan untuk membangun antarmuka aplikasi. Setiap tampilan yang kita lihat di layar, seperti tombol, teks, atau gambar, semuanya merupakan bagian dari pohon widget ini. Dalam struktur tersebut, setiap widget bisa memiliki satu atau lebih widget lain di dalamnya yang disebut sebagai child (anak), sementara widget yang membungkusnya disebut parent (induk). Hubungan parent-child ini sangat penting karena widget parent mengatur posisi, gaya, serta perilaku widget child di dalamnya.

2. Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya.
Dalam tugas Football Shop ini, saya menggunakan beberapa widget utama yang berperan penting dalam membangun tampilan aplikasi. Widget MaterialApp digunakan sebagai pembungkus utama aplikasi karena berfungsi untuk mengatur tema, navigasi, serta menerapkan gaya Material Design. Di dalamnya, saya menggunakan Scaffold yang menyediakan struktur dasar halaman seperti AppBar di bagian atas dan body di bagian tengah. Widget AppBar digunakan untuk menampilkan judul aplikasi di bagian atas layar. Pada bagian body, saya menggunakan widget Center agar seluruh elemen berada di tengah layar. Di dalam Center, terdapat widget Column yang berfungsi untuk menyusun beberapa tombol secara vertikal. Setiap tombol dibuat menggunakan ElevatedButton.icon, yang merupakan tombol dengan kombinasi ikon dan teks. Widget Icon digunakan untuk menampilkan ikon pada setiap tombol, sedangkan Text digunakan untuk memberi label atau tulisan pada tombol tersebut. Untuk menampilkan pesan saat tombol ditekan, saya menggunakan SnackBar, yaitu widget sementara yang muncul di bagian bawah layar. Selain itu, ada juga widget SizedBox yang digunakan untuk memberi jarak antar tombol agar tata letaknya terlihat rapi dan seimbang.

3. Apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini sering digunakan sebagai widget root.
Widget MaterialApp berfungsi sebagai pintu masuk utama ke aplikasi Flutter yang menggunakan konsep Material Design. Widget ini menyediakan konfigurasi penting seperti pengaturan tema warna, navigasi antar halaman, pengaturan bahasa (locale), serta manajemen tampilan dasar seperti ScaffoldMessenger yang digunakan untuk menampilkan SnackBar atau dialog. MaterialApp biasanya digunakan sebagai widget root karena menjadi pondasi utama agar seluruh widget turunan di bawahnya bisa menggunakan fitur dan gaya Material Design secara konsisten. Tanpa MaterialApp, banyak widget seperti Scaffold, AppBar, atau ElevatedButton tidak akan berfungsi dengan baik, karena mereka membutuhkan konteks dari Material Design yang disediakan oleh widget ini. 

4. Jelaskan perbedaan antara StatelessWidget dan StatefulWidget. Kapan kamu memilih salah satunya?
Perbedaan utama antara StatelessWidget dan StatefulWidget terletak pada kemampuannya untuk berubah seiring waktu. StatelessWidget adalah jenis widget yang bersifat statis, artinya tampilan dan datanya tidak berubah selama aplikasi berjalan. Widget ini cocok digunakan untuk elemen yang tidak memerlukan interaksi pengguna atau tidak bergantung pada data yang berubah, misalnya teks, ikon, atau tombol dengan fungsi tetap. Sementara itu, StatefulWidget adalah widget yang memiliki state, yaitu keadaan atau data yang bisa berubah ketika pengguna berinteraksi dengan aplikasi. Perubahan state ini dapat memengaruhi tampilan dan perilaku widget tersebut. StatefulWidget cocok digunakan pada komponen seperti form input, slider, atau animasi yang memerlukan pembaruan tampilan secara dinamis.

5. Apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di metode build?
BuildContext adalah objek yang merepresentasikan lokasi atau posisi suatu widget di dalam struktur widget tree Flutter. Objek ini sangat penting karena memberikan akses ke informasi tentang widget lain di atasnya dalam hierarki, serta memungkinkan komunikasi antar widget. Dalam metode build, BuildContext digunakan untuk membangun tampilan (UI) yang sesuai dengan posisi widget tersebut. Misalnya, ketika kita ingin menampilkan SnackBar menggunakan ScaffoldMessenger.of(context), Flutter membutuhkan context untuk mengetahui di mana Scaffold yang relevan berada, sehingga SnackBar bisa ditampilkan pada tempat yang benar. Tanpa context, Flutter tidak akan tahu bagian mana dari aplikasi yang sedang digunakan untuk menampilkan elemen tersebut.

6. Jelaskan konsep "hot reload" di Flutter dan bagaimana bedanya dengan "hot restart".
Hot reload adalah fitur pada Flutter yang memungkinkan pengembang melihat hasil perubahan kode secara langsung tanpa harus menghentikan aplikasi yang sedang berjalan. Dengan hot reload, perubahan pada tampilan atau logika sederhana akan dimuat ulang dengan cepat, namun state atau kondisi aplikasi yang sedang berjalan akan tetap dipertahankan. Fitur ini sangat membantu ketika kita ingin mengubah warna, teks, atau posisi widget tanpa kehilangan data yang sudah ada. Sementara itu, hot restart akan menghentikan seluruh aplikasi dan menjalankannya kembali dari awal. Semua state akan dihapus, dan aplikasi akan dimulai dalam kondisi baru. Meskipun prosesnya sedikit lebih lama dibanding hot reload, hot restart digunakan ketika perubahan kode memengaruhi inisialisasi aplikasi atau struktur yang tidak bisa diperbarui secara langsung.


## Tugas 8
1. Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement() pada Flutter. Dalam kasus apa sebaiknya masing-masing digunakan pada aplikasi Football Shop kamu?
Navigator.push() digunakan untuk menavigasi ke halaman baru dengan menambahkan halaman tersebut ke stack navigasi, sehingga pengguna bisa kembali ke halaman sebelumnya dengan tombol back. Sedangkan Navigator.pushReplacement() mengganti halaman saat ini dengan halaman baru, sehingga halaman lama dihapus dari stack dan pengguna tidak bisa kembali ke halaman sebelumnya.

2. Bagaimana kamu memanfaatkan hierarchy widget seperti Scaffold, AppBar, dan Drawer untuk membangun struktur halaman yang konsisten di seluruh aplikasi?
Aku memanfaatkan hierarchy widget dengan Scaffold sebagai struktur dasar setiap halaman, menyediakan area untuk AppBar, body, dan Drawer. AppBar digunakan untuk menampilkan judul halaman dan aksi penting, sementara Drawer menyediakan navigasi konsisten antarhalaman. Dengan struktur ini, setiap halaman memiliki tampilan yang seragam, mudah diakses, dan konsisten, sehingga pengguna selalu tahu di mana menu navigasi dan kontrol utama berada.

3. Dalam konteks desain antarmuka, apa kelebihan menggunakan layout widget seperti Padding, SingleChildScrollView, dan ListView saat menampilkan elemen-elemen form? Berikan contoh penggunaannya dari aplikasi kamu.
Layout widget seperti Padding, SingleChildScrollView, dan ListView memudahkan pengaturan jarak, scroll, dan penataan elemen sehingga tampilan tetap rapi dan responsif. Misalnya, pada form tambah produk, Padding memberi jarak antar elemen input, SingleChildScrollView memungkinkan form di-scroll jika layar kecil, dan ListView menampilkan daftar produk yang panjang secara vertikal. Dengan kombinasi ini, pengguna bisa mengakses semua elemen tanpa terpotong di berbagai ukuran layar.

4. Bagaimana kamu menyesuaikan warna tema agar aplikasi Football Shop memiliki identitas visual yang konsisten dengan brand toko?
Untuk identitas visual konsisten, aku menggunakan ThemeData pada MaterialApp untuk menentukan warna utama (primarySwatch) yang sesuai dengan brand toko. Misalnya, warna biru digunakan sebagai warna utama AppBar dan tombol, sementara warna hijau dan merah untuk tombol sekunder. Dengan pengaturan tema ini, semua halaman dan widget memiliki warna yang seragam.


## Tugas 9
1. Jelaskan mengapa kita perlu membuat model Dart saat mengambil/mengirim data JSON? Apa konsekuensinya jika langsung memetakan Map<String, dynamic> tanpa model (terkait validasi tipe, null-safety, maintainability)?
Model Dart (class dengan fromJson/toJson) memberi type-safety, validasi & normalisasi pusat, dan dokumentasi kode; ini mencegah banyak bug runtime akibat cast/null, memudahkan refactor, mengurangi duplikasi parsing di banyak tempat, dan membuat testing lebih mudah dibanding langsung memakai Map<String,dynamic> yang raw dan rentan error.

2. Apa fungsi package http dan CookieRequest dalam tugas ini? Jelaskan perbedaan peran http vs CookieRequest.
http adalah library HTTP generik untuk request/response tetapi tidak otomatis mengelola cookie/CSRF/session, sedangkan CookieRequest (dari pbp_django_auth) adalah wrapper yang meng-handle cookie session dan CSRF token khusus untuk integrasi dengan Django—pakai http untuk API stateless/token, pakai CookieRequest untuk session-based Django agar autentikasi berjalan otomatis.

3. Jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.
Karena CookieRequest menyimpan state autentikasi (cookie/session, CSRF) yang harus konsisten di seluruh app; membagikannya lewat Provider memungkinkan semua widget mengakses request yang sama, merespon perubahan status login secara reaktif, mencegah duplikasi state/cookie mismatch, dan memudahkan testing serta pemeliharaan.

4. Jelaskan konfigurasi konektivitas yang diperlukan agar Flutter dapat berkomunikasi dengan Django. Mengapa kita perlu menambahkan 10.0.2.2 pada ALLOWED_HOSTS, mengaktifkan CORS dan pengaturan SameSite/cookie, dan menambahkan izin akses internet di Android? Apa yang akan terjadi jika konfigurasi tersebut tidak dilakukan dengan benar?
Untuk dev perlu gunakan 10.0.2.2 dari Android emulator agar terhubung ke host machine, menambahkan IP/host itu ke ALLOWED_HOSTS Django agar request diterima, aktifkan CORS (django-cors-headers) agar browser/web tidak memblok cross-origin request, set atribut cookie SameSite/Secure sesuai skenario agar cookie session/CSRF dikirim, dan tambahkan <uses-permissionandroid:name="android.permission.INTERNET"/> di AndroidManifest; jika langkah ini diabaikan maka request akan gagal (connection refused, 400 Bad Request, CORS blocked, atau cookie tidak dikirim sehingga autentikasi gagal).

5. Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter.
User isi form -> client-side validasi -> bangun model/DTO lalu jsonEncode() -> kirim lewat CookieRequest.postJson atau http.post ke endpoint Django -> Django mem-parse, validasi server-side dan simpan ke DB -> server kembali response JSON -> Flutter menerima dan mem-parse (fromJson), lalu update state/provider sehingga UI direbuild dan data tampil.

6. Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.
Register: Flutter kirim data ke endpoint register, Django buat user; 
Login: Flutter kirim kredensial ke endpoint login, Django authenticate() dan login() lalu set sessionid cookie yang disimpan client (CookieRequest), selanjutnya setiap request terlindungi mengikutsertakan cookie tersebut sehingga backend mengenali user dan UI berubah (tampilkan menu user/logout); 
Logout: Flutter panggil endpoint logout yang memanggil logout() di Django dan server menghapus/expire session, CookieRequest/Flutter clear state lalu navigasi ke halaman login.

7. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).
- Membuat model custom dari django tugas sebelumnya pada flutter.
- Integrasi authentication dari django ke flutter dengan membuat django-app authentication dan install django-cors-headers dan tambahkan 10.0.2.2 ke allowed_host.
- Membuat fungsi login, register, dan logout pada views.py dan tambahkan ke urls.py.
- Tambahkan juga /auth sebagai urls untuk authentication ke urls.py project.
- Pada sisi flutter, install package provider dan pbp_django_auth untuk menyediakan CookieRequest.
- Buatkan juga screens login.dart dan register.dart, dan tambahkan fungsinya di tempat yang ingin ada fitur authentication.
- Tambahkan juga package HTTP, dan tambahkan code pada file androidmanifest.xml untuk memperbolehkan akses Internet pada aplikasi Flutter yang sedang dibuat.
- Menambahkan endpoint proxy untuk mengatasi masalah CORS pada gambar pada views.py di main dan juga tambahkan urls nya ke urls.py.
- Buat product_entry_card.dart pada widget dan product_entry_list.dart pada screens sebagai halaman yang telah difetch datanya dan ditampilkan. Tambahkan juga product_entry_list.dart ke drawer, tambah juga di button see product di product_card.
- Buatkan juga product_detail.dart di screens sebagai halaman untuk melihat detail product dan tambahkan ke product_entry_list.
- Integrasi form django ke flutter dengan membuat method create baru di views.py di main dan tambahkan juga urls nya ke urls.py.
- Pada sisi flutter, hubungkan add_product dengan cookierequest dan lengkapi perintah button submisi untuk mengirim data json.