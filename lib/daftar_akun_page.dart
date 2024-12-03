import 'package:flutter/material.dart';
import 'dashboard.dart'; // Pastikan file Dashboard terhubung

class DaftarAkunPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Menghilangkan tombol kembali
        title: const Text("Daftar TIX ID"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "NAMA LENGKAP",
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
            const TextField(
              decoration: InputDecoration(
                hintText: "masukkan nama anda", // Contoh placeholder
                border: UnderlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "NOMOR HANDPHONE",
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
            Row(
              children: const [
                Text(
                  "+62",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "xxx-xxxx-xxxx", // Contoh placeholder
                      border: UnderlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Navigasi ke Dashboard
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Dashboard(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[900],
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
                child: const Text(
                  "Daftar TIX ID",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
