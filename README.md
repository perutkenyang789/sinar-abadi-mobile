# Welcome to Toko Sinar Abadi
Now on mobile!

## Tugas 7

### Checklist Implementation Process
1. Men-Generate Flutter Project
    ```bash
    flutter create sinar_abadi_mobile
    ```

2. Menerapkan konsep Clean Architecture
    - Membuat file `menu.dart` dan memindahkan class `MyHomePage` ke dalamnya
    - Melakukan import `package:sinar_abadi_mobile/presentation/menu.dart` pada `main.dart`
        ```dart
        import 'package:sinar_abadi_mobile/menu.dart';
        ```

3. Mengubah class `MyHomePage` menjadi `StatelessWidget`
    ```dart
    class MyHomePage extends StatelessWidget {
        ...
    }
    ```

4. Menambahkan teks selamat datang dan pengenalan owner pada `MyHomePage`
    ```dart
    class MyHomePage extends StatelessWidget {
        final String npm = '2306275954'; // NPM
        final String name = 'Ida Made Revindra Dikta Mahendra'; // Nama
        final String className = 'PBP C'; // Kelas
    ```

    ```dart
    ...
    Padding(
        padding: EdgeInsets.only(top: 16.0),
        child: Column(
            children: [
                Text(
                'Selamat Datang di Toko Sinar Abadi',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                    ),
                ),
                Text(
                'Didirikan oleh $name ($npm) dari kelas $className',
                style: TextStyle(
                    fontSize: 16.0,
                    ),
                ),
            ],
        )),
    ...
    }
    ```

5. Membuat button card sederhana dengan icon
    - Membuat class `ItemHomePage` yang akan berisikan atribut dari button card
        ```dart
        class ItemHomepage {
            final String name;
            final IconData icon;
            final Color color;

            ItemHomepage(this.name, this.icon, this.color);
        }
        ```
    - Menambahkan list `ItemHomepage` pada `MyHomePage`
        ```dart
        final List<ItemHomepage> items = [
            ItemHomepage("Lihat Daftar Produk", Icons.list, const Color(0xFFA2D2FF)),
            ItemHomepage("Tambah Produk", Icons.add, const Color(0xFFFEE440)),
            ItemHomepage("Logout", Icons.logout, const Color(0xFFFF865E)),
        ];
        ```
    - Membuat widget `ItemCard` yang akan menampilkan button card
        ```dart
        class ItemCard extends StatelessWidget {
            final ItemHomepage item;

            const ItemCard(this.item, {super.key});

            @override
            Widget build(BuildContext context) {
                return Material(
                color: item.color,
                borderRadius: BorderRadius.circular(12),
                child: InkWell(
                    // Bagian untuk menambahkan snackbar
                    ...
                    child: Container(
                    padding: const EdgeInsets.all(8),
                    child: Center(
                        child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                            Icon(
                            item.icon,
                            color: Colors.white,
                            size: 30.0,
                            ),
                            const Padding(padding: EdgeInsets.all(3)),
                            Text(
                            item.name,
                            textAlign: TextAlign.center,
                            style: const TextStyle(color: Colors.white),
                            ),
                        ],
                        ),
                    ),
                    ),
                ),
                );
            }
        }
        ```
    - Menampilkan snackbar ketika button ditekan
        ```dart
        ...
        child: InkWell(
            onTap: () {
                ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(SnackBar(
                    content: Text(
                        "Kamu telah menekan tombol ${item.name}!",
                        style: TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    behavior: SnackBarBehavior.floating,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                    ),
                    ));
                },
            ...
        )
        ```

6. Menampilkan button card pada `MyHomePage`
    ```dart
    ...
    GridView.count(
        primary: true,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 3,
        shrinkWrap: true,
        children: items.map((ItemHomepage item) {
            return ItemCard(item);
        }).toList(),
    ),
    ...
    ```

### Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget, dan jelaskan perbedaan dari keduanya.
- Stateless Widget:
    - Widget yang tidak memiliki state
    - Tidak dapat diubah setelah diinisialisasi
    - Contoh: Text, Icon, Image

- Stateful Widget:
    - Widget yang memiliki state
    - Dapat diubah setelah diinisialisasi
    - Contoh: Form, TextField, Checkbox

### Sebutkan widget apa saja yang kamu gunakan pada proyek ini dan jelaskan fungsinya.
- Scaffold:
    - Digunakan sebagai kerangka dasar aplikasi
    - Menyediakan struktur layout material design dengan AppBar dan body

- AppBar:
    - Menampilkan bar bagian atas aplikasi
    - Berisi judul "Toko Sinar Abadi" dengan style warna putih dan bold

- Column:
    - Mengatur widget-widget secara vertikal
    - Digunakan untuk menyusun teks sambutan dan grid items

- Text:
    - Menampilkan teks seperti judul "Selamat Datang di Toko Sinar Abadi"
    - Menampilkan informasi pembuat aplikasi dengan NPM dan kelas

- Padding:
    - Memberikan jarak/ruang di sekitar widget
    - Contoh: padding: const EdgeInsets.all(16.0)

- SizedBox:
    - Memberikan jarak kosong dengan ukuran tertentu
    - Digunakan untuk spacing vertikal: height: 16.0

- GridView.count:
    - Menampilkan items dalam bentuk grid
    - Mengatur 3 kolom dengan spacing antara items

- Material:
    - Memberikan background color pada card
    - Mengatur border radius untuk tampilan melengkung

- InkWell:
    - Memberikan efek ripple saat card ditekan
    - Menangani onTap event untuk menampilkan SnackBar

- Container:
    - Membungkus konten dalam card
    - Mengatur padding dan alignment konten

- Icon:
    - Menampilkan ikon pada setiap card
    - Menggunakan Icons dari Flutter seperti Icons.list, Icons.add, Icons.logout

- SnackBar:
    - Menampilkan pesan notifikasi ketika card ditekan
    - Kustomisasi dengan backgroundColor dan border radius

- Center:
    - Mengatur posisi widget ke tengah
    - Digunakan untuk centering konten dalam card dan layout

### Apa fungsi dari setState()? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.
Fungsi dari `setState()` adalah untuk memperbarui state dari widget dan membangun ulang widget tree. Variabel yang dapat terdampak oleh fungsi `setState()` adalah variabel yang digunakan dalam widget yang diubah nilainya. Contoh: variabel `items` yang digunakan dalam `MyHomePage` akan terdampak oleh fungsi `setState()` jika nilai variabel tersebut diubah.

### Jelaskan perbedaan antara const dengan final.
Terdapat tiga perbedaan utama antara const dan final, yaitu dari segi waktu inisialisasi dimana const mengharuskan nilai diinisialisasi saat compile time sedangkan final dapat diinisialisasi saat runtime, dari segi penggunaan memory dimana const akan menggunakan memory yang sama untuk nilai yang sama sementara final tidak, dan dari segi fleksibilitas dimana final lebih fleksibel karena dapat menerima nilai pada saat runtime tidak seperti const yang harus ditentukan nilainya saat compile time.

## Tugas 8

### Apa kegunaan const di Flutter? Jelaskan apa keuntungan ketika menggunakan const pada kode Flutter. Kapan sebaiknya kita menggunakan const, dan kapan sebaiknya tidak digunakan?
`const` di Flutter digunakan untuk mendeklarasikan nilai yang bersifat konstan dan tidak akan berubah. Keuntungan menggunakan `const` adalah meningkatkan performa aplikasi karena nilai yang bersifat konstan hanya akan diinisialisasi sekali dan disimpan dalam memori. Sebaiknya kita menggunakan `const` ketika nilai tersebut sudah diketahui pada saat kompilasi dan tidak akan berubah selama runtime. Namun, jika nilai tersebut baru diketahui saat runtime atau bisa berubah, maka `const` tidak dapat digunakan dan sebaiknya menggunakan `final`.

### Jelaskan dan bandingkan penggunaan Column dan Row pada Flutter. Berikan contoh implementasi dari masing-masing layout widget ini!
`Column` dan `Row` adalah widget layout di Flutter yang digunakan untuk mengatur tata letak widget secara vertikal dan horizontal. `Column` mengatur widget secara vertikal dari atas ke bawah, sedangkan `Row` mengatur widget secara horizontal dari kiri ke kanan.

Contoh implementasi `Column`:
```dart
Column(
    children: [
        Text('Item 1'),
        Text('Item 2'),
        Text('Item 3'),
    ],
)
```

Contoh implementasi `Row`:
```dart
Row(
    children: [
        Text('Item 1'),
        Text('Item 2'),
        Text('Item 3'),
    ],
)
```

### Sebutkan apa saja elemen input yang kamu gunakan pada halaman form yang kamu buat pada tugas kali ini. Apakah terdapat elemen input Flutter lain yang tidak kamu gunakan pada tugas ini? Jelaskan!
Pada halaman form, elemen input yang digunakan antara lain `TextField` untuk input teks, `Checkbox` untuk pilihan biner, dan `DropdownButton` untuk pilihan dari daftar. Elemen input Flutter lain yang tidak digunakan pada tugas ini termasuk `Radio` untuk pilihan tunggal dari beberapa opsi, `Slider` untuk memilih nilai dalam rentang tertentu, dan `Switch` untuk pilihan on/off.

### Bagaimana cara kamu mengatur tema (theme) dalam aplikasi Flutter agar aplikasi yang dibuat konsisten? Apakah kamu mengimplementasikan tema pada aplikasi yang kamu buat?
Untuk mengatur tema dalam aplikasi Flutter, kita dapat menggunakan `ThemeData` dan mendefinisikan tema global di dalam `MaterialApp`. Tema ini mencakup warna, font, dan gaya visual lainnya yang konsisten di seluruh aplikasi. Pada aplikasi yang saya buat, saya mengimplementasikan tema dengan mendefinisikan `primaryColor`, `accentColor`, dan `textTheme` di dalam `ThemeData`.

### Bagaimana cara kamu menangani navigasi dalam aplikasi dengan banyak halaman pada Flutter?
Untuk menangani navigasi dalam aplikasi dengan banyak halaman, saya menggunakan `Navigator`. `Navigator` memungkinkan kita untuk mendorong (push) dan menghapus (pop) halaman dari stack navigasi. Kita dapat menggunakan `Navigator.push` untuk berpindah ke halaman baru dan `Navigator.pop` untuk kembali ke halaman sebelumnya.

Contoh penggunaan `Navigator.push`:
```dart
Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => HalamanBaru()),
);
```

Contoh penggunaan `Navigator.pop`:
```dart
Navigator.pop(context);
```

Selain itu, kita juga dapat menggunakan `Navigator.pushReplacement` untuk mengganti halaman saat ini dengan halaman baru tanpa menyimpan halaman sebelumnya dalam stack:
```dart
Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => HalamanBaru()),
);
```

Untuk navigasi yang lebih kompleks, kita bisa menggunakan `Navigator.pushNamed` dan `Navigator.popAndPushNamed` dengan mendefinisikan rute di `MaterialApp`:
```dart
MaterialApp(
    routes: {
        '/': (context) => HalamanUtama(),
        '/halamanBaru': (context) => HalamanBaru(),
    },
);
```

Navigasi ke halaman baru dengan nama rute:
```dart
Navigator.pushNamed(context, '/halamanBaru');
```

Mengganti halaman saat ini dengan halaman baru menggunakan nama rute:
```dart
Navigator.popAndPushNamed(context, '/halamanBaru');
```

## Tugas 9

### Jelaskan mengapa kita perlu membuat model untuk melakukan pengambilan ataupun pengiriman data JSON? Apakah akan terjadi error jika kita tidak membuat model terlebih dahulu?
Membuat model untuk pengambilan atau pengiriman data JSON sangat penting karena model bertindak sebagai cetak biru yang memastikan data yang diterima atau dikirim sesuai dengan struktur yang diharapkan. Tanpa model, data yang tidak terstruktur atau tidak sesuai dapat menyebabkan error saat aplikasi mencoba memprosesnya, karena tidak ada jaminan bahwa data tersebut memiliki format yang benar atau lengkap.

### Jelaskan fungsi dari library http yang sudah kamu implementasikan pada tugas ini
Library http dalam Dart digunakan untuk melakukan permintaan HTTP ke server, seperti GET, POST, PUT, dan DELETE. Ini memungkinkan aplikasi Flutter untuk berkomunikasi dengan API atau server backend, mengambil data dari server, mengirim data ke server, dan mengelola respons yang diterima. Dengan menggunakan library ini, pengembang dapat dengan mudah mengintegrasikan fungsionalitas jaringan ke dalam aplikasi mereka.

### Jelaskan fungsi dari CookieRequest dan jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.
CookieRequest digunakan untuk mengelola sesi pengguna dengan menyimpan dan mengirimkan cookie yang diperlukan untuk autentikasi dan otorisasi. Dengan membagikan instance CookieRequest ke semua komponen di aplikasi Flutter, kita memastikan bahwa semua permintaan HTTP yang memerlukan autentikasi menggunakan sesi yang sama, sehingga pengguna tetap terautentikasi dan dapat mengakses data atau fitur yang memerlukan login tanpa harus login ulang.

### Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter.
Mekanisme pengiriman data dimulai dari input pengguna di aplikasi Flutter, yang kemudian dikirim ke server melalui permintaan HTTP menggunakan library seperti http. Server memproses data tersebut dan mengirimkan respons kembali ke aplikasi. Aplikasi Flutter kemudian menerima respons ini, memprosesnya (misalnya, mengubah JSON menjadi model), dan menampilkan data yang relevan kepada pengguna melalui widget yang sesuai.

### Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.
Mekanisme autentikasi dimulai dengan pengguna memasukkan data akun pada Flutter, yang kemudian dikirim ke server Django melalui permintaan HTTP. Untuk login, server memverifikasi kredensial dan mengembalikan token atau cookie sesi jika berhasil. Untuk register, server membuat akun baru dan mengembalikan respons yang sesuai. Saat logout, permintaan dikirim ke server untuk menghapus sesi. Setelah autentikasi berhasil, Flutter menampilkan menu atau halaman yang sesuai berdasarkan status login pengguna.

### Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).
Implementasi checklist dimulai dengan membuat model data untuk JSON, kemudian mengintegrasikan library http untuk melakukan permintaan HTTP. Selanjutnya, buat CookieRequest untuk mengelola sesi dan bagikan instance-nya ke seluruh komponen aplikasi. Implementasikan mekanisme pengiriman data dengan menangani input pengguna dan menampilkan respons dari server. Terakhir, tambahkan fitur autentikasi dengan membuat form login dan register, mengirim data ke server Django, dan mengelola sesi pengguna untuk login, register, dan logout.
