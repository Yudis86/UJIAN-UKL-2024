import 'package:flutter/material.dart';
import 'package:ujian_ukl/buttom_navbar.dart';

class Bioskop extends StatefulWidget {
  @override
  State<Bioskop> createState() => _bioskopState();
}

class _bioskopState extends State<Bioskop> {
  final List<String> cinemas = [
    "AEON MALL JGC CGV",
    "AEON MALL TANJUNG BARAT XXI",
    "AGORA MALL IMAX",
    "AGORA MALL PREMIERE",
    "AGORA MALL XXI",
    "ARION XXI",
    "ARTHA GADING XXI",
    "BASSURA XXI",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              height: 40,
              margin: const EdgeInsets.only(bottom: 16),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search),
                        hintText: 'Cari bioskop',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.notifications),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.account_circle),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'JAKARTA',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Icon(Icons.arrow_drop_down),
              ],
            ),
          ),

          // Banner edukasi
          Container(
            margin: EdgeInsets.all(16),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.blue[50],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Icon(Icons.local_activity, color: Colors.blue, size: 40),
                SizedBox(width: 12),
                Expanded(
                  child: Text(
                    "Tandai bioskop favoritmu!\nBioskop favoritmu akan berada paling atas pada daftar ini dan pada jadwal film.",
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text("Mengerti"),
                ),
              ],
            ),
          ),

          // Daftar bioskop
          Expanded(
            child: ListView.separated(
              itemCount: cinemas.length,
              separatorBuilder: (context, index) => Divider(),
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(Icons.circle_outlined, color: Colors.grey),
                  title: Text(cinemas[index]),
                  trailing: Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {
                    // Navigasi ke detail bioskop
                  },
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavbar(currentIndex: 1),
    );
  }
}
