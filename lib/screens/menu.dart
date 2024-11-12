import 'package:flutter/material.dart';
import 'package:sinar_abadi_mobile/widgets/left_drawer.dart';
import 'package:sinar_abadi_mobile/widgets/product_card.dart';

class MyHomePage extends StatelessWidget {
  final String npm = '2306275954'; // NPM
  final String name = 'Ida Made Revindra Dikta Mahendra'; // Nama
  final String className = 'PBP C'; // Kelas

  final List<ItemHomepage> items = [
    ItemHomepage("Lihat Daftar Produk", Icons.list, const Color(0xFFA2D2FF)),
    ItemHomepage("Add Product", Icons.add, const Color(0xFFFEE440)),
    ItemHomepage("Logout", Icons.logout, const Color(0xFFFF865E)),
  ];

  MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Toko Sinar Abadi',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.secondary,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 16.0),
            Center(
              child: Column(
                children: [
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
                ],
              ),
            ),
          ],
        ),
      ),
      drawer: const LeftDrawer(),
    );
  }
}
