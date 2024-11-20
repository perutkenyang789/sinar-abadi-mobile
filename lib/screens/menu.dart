import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sinar_abadi_mobile/widgets/left_drawer.dart';
import 'package:sinar_abadi_mobile/widgets/product_card.dart';

class MyHomePage extends StatelessWidget {
  final String npm = '2306275954'; // NPM
  final String name = 'Ida Made Revindra Dikta Mahendra'; // Nama
  final String className = 'PBP C'; // Kelas

  // List of button items on the homepage
  final List<ItemHomepage> items = [
    ItemHomepage("Lihat Daftar Produk", Icons.list, const Color(0xFFA2D2FF)),
    ItemHomepage("Add Product", Icons.add, const Color(0xFFFEE440)),
    ItemHomepage("Logout", Icons.logout, const Color(0xFFFF865E)),
  ];

  MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const LeftDrawer(), // Drawer Menu
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 12.0,
          ),
          // App logo on appbar center
          child: Image.asset(
            'assets/images/big-logo.png',
            fit: BoxFit.contain,
            height: kToolbarHeight - 24.0,
          ),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.secondary,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            // Background gradient
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFE3F2FD),
              Color(0xFFBBDEFB),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 16.0),
              Center(
                child: Column(
                  children: [
                    // Page title card
                    Container(
                        padding: const EdgeInsets.all(24.0),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.surface,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            const Text(
                              'Selamat Datang di',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 24.0,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF424242),
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            Text('Toko Sinar Abadi',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.oswald(
                                  fontSize: 32.0,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xFFFF865E),
                                )),
                            const SizedBox(height: 16.0),
                            Text(
                              'Founded by',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.grey[600],
                              ),
                            ),
                            Text(
                              name,
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey[800],
                              ),
                            ),
                            Text(
                              '($npm)',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.grey[600],
                              ),
                            ),
                            Text(
                              'of $className',
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        )),

                    const SizedBox(height: 24.0), // Spacing

                    // Button items
                    GridView.count(
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      crossAxisCount: 3,
                      shrinkWrap: true,
                      children: items.map((ItemHomepage item) {
                        return AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          child: ItemCard(item),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
