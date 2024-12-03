import 'package:flutter/material.dart';
import 'package:ujian_ukl/buttom_navbar.dart';

class Ticket extends StatefulWidget {
  const Ticket({super.key});

  @override
  State<Ticket> createState() => _TicketState();
}

class _TicketState extends State<Ticket> {
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight:
              120, // Menambah tinggi AppBar untuk memberi ruang lebih
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              height: 50, // Ukuran yang lebih konsisten
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.only(
                  top: 8), // Menambahkan padding atas sedikit
              child: Row(
                children: [
                  // Kolom Pencarian
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.search),
                        hintText: 'Cari film',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          searchQuery = value; // Update searchQuery
                        });
                      },
                    ),
                  ),
                  // Tombol Notifikasi
                  IconButton(
                    icon: const Icon(Icons.notifications),
                    onPressed: () {
                      // Tambahkan aksi notifikasi
                    },
                  ),
                  // Tombol Profil
                  IconButton(
                    icon: const Icon(Icons.account_circle),
                    onPressed: () {
                      // Tambahkan aksi profil
                    },
                  ),
                ],
              ),
            ),
          ),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'SEDANG TAYANG'),
              Tab(text: 'AKAN DATANG'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildMovieGrid(isComingSoon: false),
            _buildMovieGrid(isComingSoon: true),
          ],
        ),
        bottomNavigationBar: BottomNavbar(currentIndex: 2),
      ),
    );
  }

  Widget _buildMovieGrid({required bool isComingSoon}) {
    final movies = isComingSoon
        ? [
            const MovieCard(
              title: 'Santri Pilihan Bunda',
              genre: 'Romance',
              rating: 4.0,
              imageAsset: 'dashboard/film3.webp',
            ),
            const MovieCard(
              title: 'Dua Garis Biru',
              genre: 'Drama, Romance',
              rating: 4.0,
              imageAsset: 'dashboard/film2.webp',
            ),
          ]
        : [
            const MovieCard(
              title: 'Dilan 1991',
              genre: 'Drama, Romance',
              rating: 4.5,
              imageAsset: 'dashboard/poster2.webp',
            ),
            const MovieCard(
              title: 'Sekawan Limo',
              genre: 'Horror',
              rating: 4.0,
              imageAsset: 'tiket/limo.jpg',
            ),
            const MovieCard(
              title: 'Cars 3',
              genre: 'Animasi Fantasi',
              rating: 4.4,
              imageAsset: 'tiket/cars.jpg',
            ),
            const MovieCard(
              title: 'Frozen',
              genre: 'Animasi, Fantasi',
              rating: 4.2,
              imageAsset: 'tiket/frozen.jpg',
            ),
          ];

    final filteredMovies = movies
        .where((movie) =>
            movie.title.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 16,
          childAspectRatio: 0.7,
          children: filteredMovies,
        ),
      ),
    );
  }
}

class MovieCard extends StatelessWidget {
  final String title;
  final String genre;
  final double rating;
  final String imageAsset;

  const MovieCard({
    super.key,
    required this.title,
    required this.genre,
    required this.rating,
    required this.imageAsset,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: Stack(
              children: [
                Image.asset(
                  imageAsset,
                  height: 220,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: IconButton(
                    icon: const Icon(
                      Icons.favorite_border,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  genre,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 12,
                    ),
                    const Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 12,
                    ),
                    const Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 12,
                    ),
                    const Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 12,
                    ),
                    const Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 12,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      rating.toString(),
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
