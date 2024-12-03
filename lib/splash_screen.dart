import 'package:flutter/material.dart';
import 'package:ujian_ukl/daftar_akun_page.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => DaftarAkunPage()),
      );
    });

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 23, 57),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Image.asset('tix.jpg', // Ganti dengan path gambar
                    width: 200,
                    height: 200),
              ],
            ),
            const SizedBox(height: 40),
            const Text(
              'TIX VIP, lebih seru, koin melimpah, dapat hadiah!',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Gabung TIX VIP dan kumpulkan koin untuk mendapatkan hadiah dan diskon.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white70,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
