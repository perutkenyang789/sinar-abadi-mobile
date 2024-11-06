# Welcome to Toko Sinar Abadi
Now on mobile!

## Checklist Implementation Process
> Tugas 7
1. Men-Generate Flutter Project
    ```
    flutter create sinar_abadi_mobile
    ```

1. Menerapkan konsep Clean Architecture
    - Membuat file `menu.dart` dan memindahkan class `MyHomePage` ke dalamnya
    - Melakukan import `package:sinar_abadi_mobile/presentation/menu.dart` pada `main.dart`
        ```dart
        import 'package:sinar_abadi_mobile/menu.dart';
        ```

1. Mengubah class `MyHomePage` menjadi `StatelessWidget`
    ```dart
    class MyHomePage extends StatelessWidget {
        ...
    }
    ```

1. Menambahkan teks selamat datang dan pengenalan owner pada `MyHomePage`
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
    ```

1. Membuat button card sederhana dengan icon
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
        ```

1. Menampilkan button card pada `MyHomePage`
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

## Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget, dan jelaskan perbedaan dari keduanya.
- Stateless Widget:
    - Widget yang tidak memiliki state
    - Tidak dapat diubah setelah diinisialisasi
    - Contoh: Text, Icon, Image

- Stateful Widget:
    - Widget yang memiliki state
    - Dapat diubah setelah diinisialisasi
    - Contoh: Form, TextField, Checkbox

## Sebutkan widget apa saja yang kamu gunakan pada proyek ini dan jelaskan fungsinya.
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

- SnackBar
    - Menampilkan pesan notifikasi ketika card ditekan
    - Kustomisasi dengan backgroundColor dan border radius

- Center:
    - Mengatur posisi widget ke tengah
    - Digunakan untuk centering konten dalam card dan layout
## Apa fungsi dari setState()? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.
Fungsi dari `setState()` adalah untuk memperbarui state dari widget dan membangun ulang widget tree. Variabel yang dapat terdampak oleh fungsi `setState()` adalah variabel yang digunakan dalam widget yang diubah nilainya. Contoh: variabel `items` yang digunakan dalam `MyHomePage` akan terdampak oleh fungsi `setState()` jika nilai variabel tersebut diubah.

## Jelaskan perbedaan antara const dengan final.
Terdapat tiga perbedaan utama antara const dan final, yaitu dari segi waktu inisialisasi dimana const mengharuskan nilai diinisialisasi saat compile time sedangkan final dapat diinisialisasi saat runtime, dari segi penggunaan memory dimana const akan menggunakan memory yang sama untuk nilai yang sama sementara final tidak, dan dari segi fleksibilitas dimana final lebih fleksibel karena dapat menerima nilai pada saat runtime tidak seperti const yang harus ditentukan nilainya saat compile time.